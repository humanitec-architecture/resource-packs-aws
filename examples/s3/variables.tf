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

variable "cluster_name" {
  description = "Name of the EKS cluster"
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
  default     = "hum-rp-s3-example"
}

variable "prefix" {
  description = "Prefix of the created resources"
  type        = string
  default     = "hum-rp-s3-ex-"
}
