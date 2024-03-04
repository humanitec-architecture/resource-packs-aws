locals {
  # Name restrictions https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length
  default_name = trimsuffix(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 64), "-")

  # Name restrictions https://kubernetes.io/docs/concepts/overview/working-with-objects/names/
  k8s_service_account_name = coalesce(var.name, local.default_name)
}

data "aws_iam_policy_document" "assume_role_policy" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole", "sts:TagSession"]

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "main" {
  count = length(var.policy_arns) > 0 ? 1 : 0

  name               = coalesce(var.name, local.default_name)
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "policies" {
  for_each   = var.policy_arns
  role       = aws_iam_role.main[0].name
  policy_arn = each.value
}

resource "aws_eks_pod_identity_association" "this" {
  count = length(var.policy_arns) > 0 ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = var.namespace
  service_account = local.k8s_service_account_name
  role_arn        = aws_iam_role.main[0].arn
}
