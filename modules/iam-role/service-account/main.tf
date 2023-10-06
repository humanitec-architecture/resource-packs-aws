locals {
  k8s_service_account_name = "${var.app_id}-${var.env_id}-${trimprefix(var.res_id, "modules.")}"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "main" {
  name_prefix = var.prefix
  // below uses StringLike to allow wildcards for multiple service accounts within the same namespace for workloads
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${var.oidc_provider_arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : {
            "${var.oidc_provider}:sub" : "system:serviceaccount:${var.namespace}:${local.k8s_service_account_name}",
            "${var.oidc_provider}:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "policies" {
  for_each   = var.policy_arns
  role       = aws_iam_role.main.name
  policy_arn = each.value
}
