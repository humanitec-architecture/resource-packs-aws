output "role_arn" {
  value = aws_iam_role.main.arn
}

output "k8s_service_account_name" {
  value = local.k8s_service_account_name
}
