# MYSQL RDS
# Create database subnet group

resource "aws_db_subnet_group" "rds_mysql_subnet_group" {
  name       = var.rds_mysql_subnet_group_name
  subnet_ids = [aws_subnet.private-sub3.id, aws_subnet.private-sub4.id]

  tags = {
    Name = var.rds_mysql_subnet_group_name
  }
}


resource "aws_db_instance" "project_sql" {
  allocated_storage   = var.mysql_allocated_storage
  db_name             = var.mysql_db_name
  engine              = "mysql"
  engine_version      = var.mysql_engine_version
  instance_class      = var.mysql_instance_class
  username            = var.mysql_username #best practice is to store in aws secrets manager
  password            = var.mysql_password #best practice is to store in aws secrets manager
  storage_type        = var.mysql_storage_type
  publicly_accessible = var.mysql_publicly_accessible
  port                = "3306"
  skip_final_snapshot = var.mysql_skip_final_snapshot
  #   vpc_id                   = aws_vpc.three_tier_vpc.id
  db_subnet_group_name = aws_db_subnet_group.rds_mysql_subnet_group.id
  multi_az             = var.multi-az-deployment
  tags = {
    name = var.project_sql_name
  }
}


# other parameters that could be included
#parameter_group_name = "default.mysql5.7"
# vpc_id
