terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-bucket-tka"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfstate-bucket-tka"
  }
}

provider "aws" {
   region = "us-east-1"
}

#   terraform {
#   backend "s3" {
#     bucket = "tfstate-bucket-tka"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# ressource "resource_type" "resource_name"
resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.vpc_cidr}"
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