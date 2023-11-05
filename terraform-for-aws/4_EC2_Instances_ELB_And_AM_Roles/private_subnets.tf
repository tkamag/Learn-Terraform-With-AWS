resource "aws_subnet" "private" {
  count             = length(slice(local.az_names, 0, 2)) # slice function return a subset of a set
  vpc_id            = aws_vpc.my_app.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))
  availability_zone = local.az_names[count.index]
  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

resource "aws_instance" "nat" {
  ami               = var.nat_amis[var.region]
  instance_type     = "t3.micro"
  subnet_id         = local.pub_sub_ids[0]
  source_dest_check = false
  # associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.nat_sg.id}"]

  tags = {
    Name = "JavaHomeNat"
  }
}

resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.my_app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "javaHomePrivateRT"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count          = length(slice(local.az_names, 0, 2))
  subnet_id      = local.private_sub_ids[count.index] # aws_subnet.public.*.id: Return list of subnet Id's 
  route_table_id = aws_route_table.privatert.id
}


resource "aws_security_group" "nat_sg" { # nat_sg need to be associated to NAT instance or NAT gateway
  name        = "nat_sg"
  description = "Allow traffics for Subnets"
  vpc_id      = aws_vpc.my_app.id

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
