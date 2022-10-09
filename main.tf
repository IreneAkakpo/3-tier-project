# Public subnet 1
resource "aws_subnet" "public-sub1" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-public-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = var.public_sub1_name
  }
}


# Public subnet 2
resource "aws_subnet" "public-sub2" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-public-sub2
  availability_zone = var.AZ-2

  tags = {
    Name = var.public_sub2_name
  }
}

# Private subnet 1
resource "aws_subnet" "private-sub1" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-private-sub1
  availability_zone = var.AZ-3

  tags = {
    Name = var.private_sub1_name
  }
}


# Private subnet 2
resource "aws_subnet" "private-sub2" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-private-sub2
  availability_zone = var.AZ-3

  tags = {
    Name = var.private_sub2_name
  }
}

#Subnets for Database
# Private subnet 3
resource "aws_subnet" "private-sub3" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-private-sub3
  availability_zone = var.AZ-1

  tags = {
    Name = var.private_sub3_name
  }
}

# Private subnet 4
resource "aws_subnet" "private-sub4" {
  vpc_id            = aws_vpc.Rennie-VPC.id
  cidr_block        = var.cidr-for-private-sub4
  availability_zone = var.AZ-2

  tags = {
    Name = var.private_sub4_name
  }
}

# Public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Rennie-VPC.id

  tags = {
    Name = var.public_route_table_name
  }
}


# Private route table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.Rennie-VPC.id

  tags = {
    Name = var.private_route_table_name
  }
}


# Public route table associations
resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}


# Private route table association
resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association3" {
  subnet_id      = aws_subnet.private-sub3.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association4" {
  subnet_id      = aws_subnet.private-sub4.id
  route_table_id = aws_route_table.private-route-table.id
}

# Internet gateway
resource "aws_internet_gateway" "Rennie-IGW" {
  vpc_id = aws_vpc.Rennie-VPC.id

  tags = {
    Name = var.internet_gateway_name
  }
}


# AWS Route IGW-Public route table
resource "aws_route" "Rennie-igw-association" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.Rennie-IGW.id
  destination_cidr_block = var.IGW_destination_cidr_block
}
# Create Elastic IP
resource "aws_eip" "Rennie-EIP" {
  vpc = var.EIP
}

# Create NAT gateway
resource "aws_nat_gateway" "Nat-gateway" {
  allocation_id = aws_eip.Rennie-EIP.id
  subnet_id     = aws_subnet.public-sub1.id

  tags = {
    Name = var.nat_gateway_name
  }
}


# Associating NATgateway with private route table
resource "aws_route" "Nat-association" {
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.Nat-gateway.id
  destination_cidr_block = var.Nat-gateway_destination_cidr_block
}