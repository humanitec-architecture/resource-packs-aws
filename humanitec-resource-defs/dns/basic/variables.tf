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
  default     = "refs/heads/main"
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

variable "hosted_zone_id" {
  description = "The id of the hosted zone in which this record set will reside."
  type        = string
}
