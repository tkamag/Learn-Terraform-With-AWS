# Declare the data source
data "aws_availability_zones" "azs" {
}

data "aws_availability_zones" "allll" {
  all_availability_zones = true
}
