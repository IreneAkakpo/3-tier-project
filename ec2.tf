resource "aws_instance" "Server1" {
  ami                         = var.instance-ami # eu-west-2
  instance_type               = var.ec2_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sec-group.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-sub1.id
  user_data                   = <<-EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Hello Welcome to Irene's Server1" | sudo tee /var/www/html/index.html
EOF


  tags = {
    "name" = var.ec2_instance1_name
    OS     = var.OS
  }
}

resource "aws_instance" "Server2" {
  ami                         = var.instance-ami # eu-west-2
  instance_type               = var.ec2_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sec-group.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-sub2.id
  user_data                   = <<-EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Hello Welcome to Irene's Server2" | sudo tee /var/www/html/index.html
EOF



  tags = {
    "name" = var.ec2_instance2_name
    OS     = var.OS
  }
}


/* resource "aws_instance" "Server3" {
  ami                         = var.instance-ami  # eu-west-2
  instance_type               = "t2.micro"
  key_name                    = "July-KP"
  vpc_security_group_ids      = [aws_security_group.sec-group.id]
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.private-sub1.id

   tags = {
    "name" = "Server2"
    OS = "UBUNTU"
  }
} */

