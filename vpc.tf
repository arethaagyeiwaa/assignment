#vpc
resource "aws_vpc" "assignment" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "assigment"
  }
}


#public subnet 1
resource "aws_subnet" "pub-sub-1" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.pub_sub_1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "pub-sub-1"
  }
}


#public subnet 2
resource "aws_subnet" "pub-sub-2" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.pub_sub_2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "pub-sub-2"
  }
}

#public subnet 3
resource "aws_subnet" "pub-sub-3" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.pub_sub_3
  availability_zone = "eu-west-2c"

  tags = {
    Name = "pub-sub-3"
  }
}

#private subnet 1
resource "aws_subnet" "priv-sub-1" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.priv_sub_1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "priv-sub-1"
  }
}

#private subnet 2
resource "aws_subnet" "priv-sub-2" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.priv_sub_2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "priv-sub-2"
  }
}

#private subnet 3
resource "aws_subnet" "priv-sub-3" {
  vpc_id            = aws_vpc.assignment.id
  cidr_block        = var.priv_sub_3
  availability_zone = "eu-west-2c"

  tags = {
    Name = "priv-sub-3"
  }
}


#public route table
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.assignment.id

  tags = {
    Name = "pub-rt"
  }
}

#private route table
resource "aws_route_table" "priv-rt" {
  vpc_id = aws_vpc.assignment.id

  tags = {
    Name = "priv-rt"
  }
}

#public route table association
resource "aws_route_table_association" "pub-rt-1-association" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pub-rt-2-association" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pub-rt-3-association" {
  subnet_id      = aws_subnet.pub-sub-3.id
  route_table_id = aws_route_table.pub-rt.id
}

#private route table association
resource "aws_route_table_association" "priv-rt-1-association" {
  subnet_id      = aws_subnet.priv-sub-1.id
  route_table_id = aws_route_table.priv-rt.id
}

resource "aws_route_table_association" "priv-rt-2-association" {
  subnet_id      = aws_subnet.priv-sub-2.id
  route_table_id = aws_route_table.priv-rt.id
}

resource "aws_route_table_association" "priv-rt-3-association" {
  subnet_id      = aws_subnet.priv-sub-3.id
  route_table_id = aws_route_table.priv-rt.id
}


#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.assignment.id

  tags = {
    Name = "igw"
  }
}


#aws route
resource "aws_route" "pub-igw-route" {
  route_table_id         = aws_route_table.pub-rt.id
  destination_cidr_block = var.rt_cidr
  gateway_id             = aws_internet_gateway.igw.id

}




