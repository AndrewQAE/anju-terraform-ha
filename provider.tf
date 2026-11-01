terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "anju-terraform-state"
    key    = "anju-terraform-ha/terraform.tfstate"
    region = "eu-west-2"

  }

}

provider "aws" {
  region = "eu-west-2"
}
