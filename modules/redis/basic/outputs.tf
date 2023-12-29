output "host" {
  value = aws_elasticache_replication_group.main.configuration_endpoint_address
}

output "port" {
  value = var.port
}

output "username" {
  # redis doesn't use usernames yet
  value = ""
}

output "password" {
  value     = aws_elasticache_replication_group.main.auth_token
  sensitive = true
}
