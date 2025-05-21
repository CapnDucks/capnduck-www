terraform {
  required_version = "= 1.12.1"

  backend "s3" {
    bucket       = "capnduck-terraform-tfstate"
    encrypt      = true
    key          = "capnduck-www.tfstate"
    region       = "us-west-2"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}
