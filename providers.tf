terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.19.0"
    }
  }
  
  required_version = ">= 1.5.0"
  
  /*backend "s3" {
   bucket         = "terraform-s3-remote-state-693414"
   key            = "global/s3/terraform.tfstate"
   region         = "us-west-2"

   dynamodb_table = "terraform-lock-table"
   encrypt        = true
  }
  */
}