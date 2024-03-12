terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "capnduck-terraform-tfstate"
    key            = "capnduck-www.tfstate"
    dynamodb_table = "terraform-tfstate-lock"
    region         = "us-west-2"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
