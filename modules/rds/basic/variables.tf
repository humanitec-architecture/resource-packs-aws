variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "region" {
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "res_id" {
  type = string
}

variable "name" {
  type        = string
  description = "Resource name"
  default     = ""
}

variable "database_name" {
  type = string
}

variable "username" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "create_db_subnet_group" {
  type    = bool
  default = true
}

variable "db_subnet_group_name" {
  type        = string
  description = "DB subnet group name"
  default     = ""
}

variable "subnet_ids" {
  type = set(string)
}

variable "vpc_security_group_ids" {
  type = set(string)
}

variable "port" {
  type    = number
  default = 5432
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "major_engine_version" {
  type    = string
  default = "14"
}

variable "engine_version" {
  type    = string
  default = "14"
}

variable "group_family" {
  type    = string
  default = "postgres14"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.large"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "max_allocated_storage" {
  type    = number
  default = 100
}

variable "multi_az" {
  type    = bool
  default = true
}

variable "maintenance_window" {
  type    = string
  default = null # "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  type    = string
  default = null # "03:00-06:00"
}

variable "backup_retention_period" {
  type    = number
  default = 1
}

variable "create_cloudwatch_log_group" {
  type    = bool
  default = false
}

variable "enabled_cloudwatch_logs_exports" {
  type    = set(string)
  default = []
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "performance_insights_enabled" {
  type    = bool
  default = true
}

variable "performance_insights_retention_period" {
  type    = number
  default = 7
}

variable "create_monitoring_role" {
  type    = bool
  default = true
}

variable "monitoring_interval" {
  type    = number
  default = 60
}

variable "monitoring_role_name" {
  type    = string
  default = "rds-monitoring-role"
}

variable "monitoring_role_use_name_prefix" {
  type    = bool
  default = true
}

variable "monitoring_role_description" {
  type    = string
  default = "Monitoring role for RDS cluster"
}

variable "parameters" {
  type    = set(any)
  default = []
}
