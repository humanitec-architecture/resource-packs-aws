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
  description = "AWS Region"
  type        = string
}

variable "node_type" {
  description = "AWS ElastiCache node type"
  type        = string
  default     = "cache.t4g.micro"
}

variable "parameter_group_name" {
  description = "AWS ElastiCache parameter group name"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "num_cache_clusters" {
  description = "Number of AWS ElastiCache clusters"
  type        = number
  default     = 1
}

variable "subnet_group_name" {
  description = "Name of the AWS ElastiCache subnet group to use"
  type        = string
}

variable "security_group_ids" {
  description = "List of AWS security group IDs to use for the AWS ElastiCache cluster"
  type        = set(string)
}

variable "name" {
  type        = string
  description = "Resource name (can contain placeholders like $${context.app.id})"
  default     = ""
}
