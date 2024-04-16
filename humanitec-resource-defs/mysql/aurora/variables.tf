variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "resource_packs_aws_url" {
  description = "AWS Resource Pack git url"
  type        = string
  default     = "https://github.com/humanitec-architecture/resource-packs-aws.git"
}

variable "resource_packs_aws_rev" {
  description = "AWS Resource Pack git branch"
  type        = string
}

variable "append_logs_to_error" {
  description = "Append Terraform logs to error messages."
  type        = bool
  default     = false
}

variable "driver_account" {
  description = "The ID of the Resource Account which should be used."
  type        = string
}

variable "region" {
  type = string
}

variable "name" {
  type        = string
  description = "Resource name (can contain placeholders like $${context.app.id})"
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
  description = "DB subnet group name (can contain placeholders like $${context.app.id})"
  default     = ""
}

variable "create_db_subnet_group" {
  type    = bool
  default = true
}

variable "type" {
  type    = string
  default = "mysql"
}

variable "engine" {
  type    = string
  default = "aurora-mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "group_family" {
  type    = string
  default = "aurora-mysql8.0"
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
      db_parameter_group_name = "default.aurora-mysql8.0"
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
