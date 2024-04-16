variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "region" {
  type = string
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "name" {
  type        = string
  description = "Resource name"
  default     = ""
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
