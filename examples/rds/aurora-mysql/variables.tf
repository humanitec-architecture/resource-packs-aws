variable "name" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "humanitec_org_id" {
  type = string
}

variable "humanitec_token" {
  type = string
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

variable "humanitec_host" {
  type    = string
  default = "https://api.humanitec.io"
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
