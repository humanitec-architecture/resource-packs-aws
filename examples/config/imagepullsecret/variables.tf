variable "region" {
  description = "AWS Region"
  type        = string
}

variable "name" {
  description = "Name of the example application"
  type        = string
  default     = "hum-rp-ips-example"
}

variable "prefix" {
  description = "Prefix of the created resources"
  type        = string
  default     = "hum-rp-ips-ex-"
}

variable "humanitec_secret_store_id" {
  description = "Humanitec Secret Store ID that points to AWS Secrets Manager"
  type        = string
}
