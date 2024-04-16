variable "region" {
  type        = string
  description = "AWS Region to create resources"
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

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "AWS Subnet IDs to use for the AWS RDS cluster"
  type        = set(string)
}

variable "k8s_node_security_group_id" {
  description = "AWS Security Group ID of the kubernetes nodes to allow access to the AWS RDS cluster"
  type        = string
}

variable "name" {
  description = "Name of the example application"
  type        = string
  default     = "hum-rp-mysql-example"
}

variable "prefix" {
  description = "Prefix of the created resources"
  type        = string
  default     = "hum-rp-mysql-ex-"
}
