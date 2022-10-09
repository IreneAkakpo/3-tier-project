# Creating target group
resource "aws_lb_target_group" "Target-group" {
  health_check {
    interval            = 200
    path                = "/"
    protocol            = "HTTP"
    timeout             = 60
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  name        = var.target_group_name
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Rennie-VPC.id

  tags = {
    Name = var.target_group_name
  }
}


#Creating ALB
resource "aws_lb" "application-lb" {
  name                       = var.load_balancer_name
  internal                   = var.internal
  ip_address_type            = var.ip_address_type
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.sec-group.id]
  subnets                    = [aws_subnet.public-sub1.id, aws_subnet.public-sub2.id]
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    name = var.load_balancer_name
  }
}


# Creating listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Target-group.arn
  }
}


#Creating Target group and EC2 attachment
resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = aws_lb_target_group.Target-group.arn
  target_id        = aws_instance.Server1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_attach2" {
  target_group_arn = aws_lb_target_group.Target-group.arn
  target_id        = aws_instance.Server2.id
  port             = 80
}