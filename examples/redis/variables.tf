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

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "AWS Subnet IDs to use for the AWS ElastiCache cluster"
  type        = set(string)
}

variable "k8s_node_security_group_id" {
  description = "AWS Security Group ID of the kubernetes nodes to allow access to the AWS ElastiCache cluster"
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
  default     = "refs/heads/main"
}

variable "name" {
  description = "Name of the example application"
  type        = string
  default     = "redis-test"
}
