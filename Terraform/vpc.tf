resource "aws_vpc" "semantix" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC semantix"
  }
}

resource "aws_subnet" "sub-semantix" {
  vpc_id     = aws_vpc.sub-semantix.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sub-semantix"
  }
}

resource "aws_internet_gateway" "gw-semantix" {
  vpc_id = aws_vpc.semantix.id

  tags = {
    Name = "gw-semantix""
  }
}


resource "aws_route_table" "route-semantix" {
  vpc_id = aws_vpc.route-semantix.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.gw-semantix.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "route-semantix"
  }
}


resource "aws_security_group" "SG-semantix" {
  name        = "SG-semantix"
  description = "SG-semantix trafico de entrada"
  vpc_id      = aws_vpc.semantix.id

  ingress {
    description      = "SG-semantix VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.semantix.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.semantix.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-semantix 443"
  }
}