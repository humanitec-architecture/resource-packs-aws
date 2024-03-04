output "role_arn" {
  value = length(var.policy_arns) > 0 ? aws_iam_role.main[0].arn : ""
}

output "k8s_service_account_name" {
  value = local.k8s_service_account_name
}
