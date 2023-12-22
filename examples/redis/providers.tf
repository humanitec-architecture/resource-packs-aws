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
  default_tags {
    tags = {
      "managed-by" = "humanitec/resource-pack-aws/examples"
    }
  }
}


provider "humanitec" {}
