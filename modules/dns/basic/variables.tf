
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

variable "res_id" {
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "hosted_zone_id" {
  description = "The id of the hosted zone in which this record set will reside."
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

variable "aws_hosted_zone" {
  description = "Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone."
  type        = string
  default     = ""
}
