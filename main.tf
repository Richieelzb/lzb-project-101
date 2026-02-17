terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }

  backend "s3" {
    bucket = "terraform-practice-lzb-001" //personal account
    key    = "lzb-project-101/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}