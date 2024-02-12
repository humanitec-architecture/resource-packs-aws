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

variable "prefix" {
  type        = string
  description = "Name prefix"
}

variable "name" {
  type        = string
  description = "Resource name (can contain placeholders like $${context.app.id})"
  default     = ""
}
