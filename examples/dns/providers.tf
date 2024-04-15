terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    humanitec = {
      source  = "humanitec/humanitec"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  default_tags {
    tags = {
      "managed_by" = "terraform"
      "source"     = "github.com/humanitec-architecture/resource-pack-aws"
    }
  }
}

provider "humanitec" {}

provider "random" {}
