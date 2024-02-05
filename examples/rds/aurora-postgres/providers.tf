terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    humanitec = {
      source  = "humanitec/humanitec"
      version = "~> 0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "humanitec" {
  host   = var.humanitec_host
  org_id = var.humanitec_org_id
  token  = var.humanitec_token
}
