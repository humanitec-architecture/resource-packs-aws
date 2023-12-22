variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
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

variable "port" {
  description = "Port to use for the AWS ElastiCache cluster"
  type        = number
  default     = 6379
}
