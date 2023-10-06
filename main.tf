provider "aws" {
    region = "us-west-2"
}

// VARIABLES
variable "test-vpc" {
  description = "VPC cidr"
  default = "10.0.0.0/16"
}

variable "priv-subnet-1" {
  description = "Subnet cidr"  
  default = "10.0.10.0/24"
}

variable "environment" {
  description = "Environment tags"
  default = "test-use"  
}

// RESOURCES
resource "aws_vpc" "test-vpc" {
    cidr_block = var.test-vpc
    tags = {
      "Name" = "test-app",
      "Environment" = var.environment
    }
}

resource "aws_subnet" "priv-subnet-1" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.priv-subnet-1
  availability_zone = "us-west-2a"
    tags = {
      "Name" = "test-app",
      "Environment" = var.environment
    }
}

// OUTPUTS
output "test-vpc-id" {
  description = "VPC ID"
  value = aws_vpc.test-vpc.id
}

output "test-vpc-cidr" {
  description = "VPC CIDR"
  value = aws_vpc.test-vpc.cidr_block
}

output "priv-subnet-1-id" {
  description = "SUBNET ID"
  value = aws_subnet.priv-subnet-1.id
}

output "priv-subnet-1-cidr" {
  description = "SUBNET CIDR"
  value = aws_subnet.priv-subnet-1.cidr_block
}
