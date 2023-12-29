output "name" {
  value = module.db.db_instance_name
}

output "username" {
  value     = module.db.db_instance_username
  sensitive = true
}

output "password" {
  value     = var.password
  sensitive = true
}

output "host" {
  value = module.db.db_instance_address
}

output "port" {
  value = module.db.db_instance_port
}
