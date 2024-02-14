variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
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

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
}

variable "vpc" {
  type = string
}

variable "subnets" {
  type = set(string)
}

variable "db_subnet_group_name" {
  type        = string
  description = "DB subnet group name"
  default     = ""
}

variable "create_db_subnet_group" {
  type    = bool
  default = true
}

variable "engine" {
  type    = string
  default = "aurora-postgresql"
}

variable "engine_version" {
  type    = string
  default = "14.7"
}

variable "group_family" {
  type    = string
  default = "aurora-postgresql14"
}

variable "storage_type" {
  type    = string
  default = "aurora"
}

variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "instances" {
  type = map(any)
  default = {
    1 = {
      instance_class          = "db.r5.2xlarge"
      publicly_accessible     = true
      db_parameter_group_name = "default.aurora-postgresql14"
    }
    2 = {
      identifier     = "static-member-1"
      instance_class = "db.r5.2xlarge"
    }
  }
}

variable "endpoints" {
  type    = any
  default = {}
}

variable "security_group_rules" {
  type    = any
  default = {}
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "db_cluster_parameter_group_parameters" {
  type    = set(any)
  default = []
}

variable "db_parameter_group_parameters" {
  type    = set(any)
  default = []
}

variable "create_cloudwatch_log_group" {
  type    = bool
  default = false
}

variable "enabled_cloudwatch_logs_exports" {
  type    = set(string)
  default = []
}

variable "create_db_cluster_activity_stream" {
  type    = bool
  default = false
}

variable "db_cluster_activity_stream_kms_key_id" {
  type    = string
  default = null
}

variable "db_cluster_activity_stream_mode" {
  type    = string
  default = "async"
}
