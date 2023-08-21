terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "proj-tfstate"
    key            = "LAMP/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      owner     = "crommie"
      project   = "L.A.M.P"
      terraform = "true"
      env       = "dev"
    }
  }
}
