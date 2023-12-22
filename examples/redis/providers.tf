terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    humanitec = {
      source = "humanitec/humanitec"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      "managed-by" = "humanitec/resource-pack-aws/examples"
    }
  }
}


provider "humanitec" {}
