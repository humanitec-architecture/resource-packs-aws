variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "res_id" {
  type = string
}

variable "name" {
  type        = string
  description = "Resource name"
  default     = ""
}
