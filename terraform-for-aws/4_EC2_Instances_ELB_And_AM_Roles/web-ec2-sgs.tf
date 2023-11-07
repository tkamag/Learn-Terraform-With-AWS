resource "aws_security_group" "web_sg" { # nat_sg need to be associated to NAT instance or NAT gateway
  name        = "web_sg"
  description = "Allow traffics for web apps on ec2"
  vpc_id      = aws_vpc.my_app.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp" # Specify all port
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" # Specify all port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Specify all port
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
