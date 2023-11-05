terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-bucket-tka"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-bucket-tka"
  }
}

provider "aws" {
  region = var.region
}


# output "test" {
#   value = data.aws_vpc.selected.id
# }
