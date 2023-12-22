output "name" {
  value = module.aurora.cluster_database_name
}

output "username" {
  value     = module.aurora.cluster_master_username
  sensitive = true
}

output "password" {
  value     = module.aurora.cluster_master_password
  sensitive = true
}

output "host" {
  value = module.aurora.cluster_endpoint
}

output "port" {
  value = module.aurora.cluster_port
}
