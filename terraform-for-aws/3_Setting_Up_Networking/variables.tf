variable "vpc_cidr" {
  description = "Choose cidr for VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "region" {
  description = "Choose region for your stack"
  type        = string
  default     = "us-east-1"
}

variable "nat_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-05c13eab67c5d8861"
    us-east-2 = "ami-0e8a34246278c21e4"
  }

}
