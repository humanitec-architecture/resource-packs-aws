locals {
  k8s_service_account_name = "${var.app_id}-${var.env_id}-${trimprefix(var.res_id, "modules.")}"
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

  name_prefix        = var.prefix
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
