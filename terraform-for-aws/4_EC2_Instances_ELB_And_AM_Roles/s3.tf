resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_app_s3_bucket
  #region = var.region
  #acl    = private

  tags = {
    Name        = "javahome-app-dev"
    Environment = "${terraform.workspace}"
  }
}
