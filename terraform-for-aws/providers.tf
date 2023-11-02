terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
   region = "us-east-1"
}

# ressource "resource_type" "resource_name"
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "JavaHomeVpc"
    Environment = "Dev"
    Location    = "Paris - France"
  }
}

output "vpc_cidr" {
    value = "${aws_vpc.my_vpc.cidr_block}"
}