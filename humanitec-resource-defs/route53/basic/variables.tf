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

variable "hosted_zone" {
  description = "The name of the hosted zone in which this record set will reside."
  type        = string
}

variable "subdomain" {
  description = "The subdomain of the DNS name that the DNS record is for."
  type        = string
}

variable "ip_address" {
  description = "The IPv4 address that the DNS name should resolve to."
  type        = string
  default     = ""
}

variable "ipv6_address" {
  description = "The IPv6 address that the DNS name should resolve to."
  type        = string
  default     = ""
}

variable "name" {
  description = "A valid fully qualified domain name that the DNS name should resolve to."
  type        = string
  default     = ""
}

variable "alias_name" {
  description = "DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
  type        = string
  default     = ""
}

variable "alias_zone_id" {
  description = "Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone."
  type        = string
  default     = ""
}

variable "alias_evaluate_target_health" {
  description = "Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set."
  type        = bool
  default     = false
}
