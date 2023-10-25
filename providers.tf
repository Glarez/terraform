terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.19.0"
    }
  }
  
  required_version = ">= 1.5.0"

  backend "remote" {
    organization = "Zapalaver"

    workspaces {
      name = "zapalaver-dev"
    }    
  }  
}
