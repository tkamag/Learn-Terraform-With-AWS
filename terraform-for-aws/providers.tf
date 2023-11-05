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
  count            = terraform.workspace == "dev" ? 0 : 1
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "JavaHomeVpc"
    Environment = "${terraform.workspace}$"
    Location    = "Paris - France"
  }
}

# output "vpc_cidr" {
#     value = "${aws_vpc.my_vpc.cidr_block}"
# }

# output "test" {
#     value = "${data.aws_availability_zones.azs.group_names}"
# }

# output "test1" {
#     value = "${data.aws_availability_zones.azs.id}"
# }

# output "test2" {
#     value = "${data.aws_availability_zones.azs.names}"
# }

# output "test3" {
#     value = "${data.aws_availability_zones.azs.zone_ids}"
# }


# output "Number" {
#     value = "${length(data.aws_availability_zones.azs.zone_ids)}"
# }

output "test4" {
  value = data.aws_availability_zones.allll.names
}
