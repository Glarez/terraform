terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  required_version = "~> 1.13"

   backend "remote" {
    organization    = "Zapalaver"
   workspaces {
    }
      name = "terraform-github"
  }
}

provider "aws" {
  region = "us-east-1"
}