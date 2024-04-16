variable "prefix" {
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

variable "policy" {
  description = "Name of the exposed policy"
  type        = string
}

variable "sqs_resource_class" {
  description = "The class of the SQS resource"
  type        = string
}
