terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  # Injected via the humanitec-terraform-driver
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  # TODO
  default_tags {
    tags = {
      "managed-by" = "humanitec"
      "hum-app-id" = var.app_id
      "hum-env-id" = var.env_id
      "hum-res-id" = var.res_id
    }
  }
}
