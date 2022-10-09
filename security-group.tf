# Configuring Security Group

resource "aws_security_group" "sec-group" {
  name        = var.security_group_name
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.Rennie-VPC.id
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sg_http_ingress_cidr_block
  }


  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_ssh_ingress_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_egress_cidr_block
  }

  tags = {
    Name = var.security_group_name
  }
}


/* # Configuring Security Group 2

resource "aws_security_group" "sec-group2" {
  name        = "sec-group"
  description = "Allow inbound traffic for public instances"
  vpc_id      = aws_vpc.Rennie-VPC.id
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group2"
  }
} */