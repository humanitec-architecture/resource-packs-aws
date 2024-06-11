variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "account_id" {
  description = "The id of the hosted zone in which this record set will reside."
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "access_key_id_ref" {
  description = "AWS Access Key ID (Secret Store reference)"
  type = object({
    ref     = optional(string)
    store   = optional(string)
    value   = optional(string)
    version = optional(string)
  })
}

variable "secret_access_key_ref" {
  description = "AWS Secret Access Key (Secret Store reference)"
  type = object({
    ref     = optional(string)
    store   = optional(string)
    value   = optional(string)
    version = optional(string)
  })
}
