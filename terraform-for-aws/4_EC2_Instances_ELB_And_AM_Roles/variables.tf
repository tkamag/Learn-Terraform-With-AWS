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

variable "web_instance_type" {
  description = "Choose instance type for your Web"
  type        = string
  default     = "t2.micro"
}

variable "web_ec2_count" {
  description = "Choose number of ec2 for web"
  type        = string
  default     = "2"
}


variable "nat_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-05c13eab67c5d8861"
    us-east-2 = "ami-0e8a34246278c21e4"
  }
}

variable "web_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-05c13eab67c5d8861"
    us-east-2 = "ami-0e8a34246278c21e4"
  }
}

variable "web_tags" {
  type = map(string)
  default = {
    Name = "WebServer"
  }
}
