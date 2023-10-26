terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = "~> 1.0"

  backend "remote" {
  organization = "Zapalaver"
  workspaces {
    name = "zapalaver-dev"
    }    
  }
}


provider "aws" {
  region = "us-east-1"
}
