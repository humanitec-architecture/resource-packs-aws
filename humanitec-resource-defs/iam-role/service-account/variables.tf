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

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "policy_classes" {
  description = "Humanitec aws-policy classes to provision by default for this role."
  type        = list(string)
  default     = []
}

variable "name" {
  type        = string
  description = "Resource name (can contain placeholders like $${context.app.id})"
  default     = ""
}
