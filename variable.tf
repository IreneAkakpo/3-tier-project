# Region name variable
variable "region-name" {
  description = "making region name a variable"
  default     = "eu-west-2"
  type        = string

}

# Cidr block variable
variable "cidr-for-vpc" {
  description = "making cidr a variable"
  default     = "10.0.0.0/16"
  type        = string

}

# VPC Name/tag variable
variable "vpc_name" {
  description = "making vpc-name a variable"
  default     = "Rennie-VPC"
  type        = string

}

# Instance tenancy variable
variable "instance_tenancy" {
  description = "making instance tenancy a variable"
  default     = "default"
  type        = string

}


#DNS hostnames variable
variable "enable_dns_hostnames" {
  description = "making enable dns hostnames a variable"
  default     = "true"
  type        = bool

}

#DNS support variable
variable "enable_dns_support" {
  description = "making enable dns support a variable"
  default     = "true"
  type        = bool

}


#EIP for VPC status
variable "EIP" {
  description = "making eip for vpc a variable"
  default     = "true"
  type        = bool

}

# Public subnet1 variable
variable "cidr-for-public-sub1" {
  description = "making public subnet1 cidr a variable"
  default     = "10.0.1.0/24"
  type        = string

}

# Public subnet1 Name/tag variable
variable "public_sub1_name" {
  description = "making public_sub1_name a variable"
  default     = "public-sub1"
  type        = string

}

# Public subnet2 variable
variable "cidr-for-public-sub2" {
  description = "making public subnet2 cidr a variable"
  default     = "10.0.2.0/24"
  type        = string

}

# Public subnet2 Name/tag variable
variable "public_sub2_name" {
  description = "making public_sub2_name a variable"
  default     = "public-sub2"
  type        = string

}

# Private subnet1 variable
variable "cidr-for-private-sub1" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.3.0/24"
  type        = string

}

# Private subnet1 Name/tag variable
variable "private_sub1_name" {
  description = "making private_sub1_name a variable"
  default     = "private-sub1"
  type        = string

}

# Private subnet2 variable
variable "cidr-for-private-sub2" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.4.0/24"
  type        = string

}

# Private subnet2 Name/tag variable
variable "private_sub2_name" {
  description = "private_sub2_name a variable"
  default     = "private-sub2"
  type        = string

}

# Private subnet3 variable
variable "cidr-for-private-sub3" {
  description = "making private subnet3 cidr a variable"
  default     = "10.0.5.0/24"
  type        = string

}

# Private subnet3 Name/tag variable
variable "private_sub3_name" {
  description = "private_sub3_name a variable"
  default     = "private-sub3"
  type        = string

}

# Private subnet4 variable
variable "cidr-for-private-sub4" {
  description = "making private subnet4 cidr a variable"
  default     = "10.0.6.0/24"
  type        = string

}

# Private subnet4 Name/tag variable
variable "private_sub4_name" {
  description = "private_sub4_name a variable"
  default     = "private-sub4"
  type        = string

}

# Public route table Name/tag variable
variable "public_route_table_name" {
  description = "making public_route_table_name a variable"
  default     = "public-route-table"
  type        = string

}

# Private route table Name/tag variable
variable "private_route_table_name" {
  description = "making private_route_table_name a variable"
  default     = "private-route-table"
  type        = string

}

# Availability Zone Variable 1
variable "AZ-1" {
  description = "availability zone"
  default     = "eu-west-2a"
  type        = string
}


# Availability Zone Variable 2
variable "AZ-2" {
  description = "availability zone"
  default     = "eu-west-2b"
  type        = string
}


# Availability Zone Variable 3
variable "AZ-3" {
  description = "availability zone"
  default     = "eu-west-2c"
  type        = string
}

# Internet Gateway Name/tag variable
variable "internet_gateway_name" {
  description = "making IGW-name a variable"
  default     = "Rennie-IGW"
  type        = string

}

# Public route destination cidr block
variable "IGW_destination_cidr_block" {
  description = "making IGW destination cidr block a variable"
  default     = "0.0.0.0/0"
  type        = string
}

# NAT Gateway Name/tag variable
variable "nat_gateway_name" {
  description = "making NAT-gateway-name a variable"
  default     = "Nat-gateway"
  type        = string

}

# Private route destination cidr block
variable "Nat-gateway_destination_cidr_block" {
  description = "making private route destination cidr block a variable"
  default     = "0.0.0.0/0"
  type        = string
}

# EC2 AMI variable
variable "instance-ami" {
  description = "making instance ami a variable"
  default     = "ami-05a8c865b4de3b127" # eu-west-2
  type        = string

}

# EC2 instance type variable
variable "ec2_instance_type" {
  description = "making ec2 instance type a variable"
  default     = "t2.micro"
  type        = string

}

# Key name variable
variable "key_name" {
  description = "making key name a variable"
  default     = "July-KP"
  type        = string

}

# First EC2 instance name variable
variable "ec2_instance1_name" {
  description = "making 1st ec2 instance name a variable"
  default     = "Server1"
  type        = string

}

# Second EC2 instance name variable
variable "ec2_instance2_name" {
  description = "making 2nd ec2 instance name a variable"
  default     = "Server2"
  type        = string

}

# OS name variable
variable "OS" {
  description = "making OS a variable"
  default     = "UBUNTU"
  type        = string

}


# Security group name variable variable
variable "security_group_name" {
  description = "making security group name a variable"
  default     = "sec-group"
  type        = string

}

#  Security group ssh ingress cidr variable
variable "sg_ssh_ingress_cidr_block" {
  description = "making sg_ssh_ingress_cidr_block a variable"
  default     = ["0.0.0.0/0"]
  type        = list(any)
}

#  Security group http ingress cidr
variable "sg_http_ingress_cidr_block" {
  description = "making sg_http_ingress_cidr_block a variable"
  default     = ["0.0.0.0/0"]
  type        = list(any)
}

#  Security group egress cidr variable
variable "sg_egress_cidr_block" {
  description = "making sg_egress_cidr_block a variable"
  default     = ["0.0.0.0/0"]
  type        = list(any)
}

# Load balancer target group name a variable
variable "target_group_name" {
  description = "making target group name a variable"
  default     = "Rennie-alb-tg"
  type        = string
}


# Target group target-type a variable
variable "target_type" {
  description = "making target group target_type a variable"
  default     = "instance"
  type        = string
}

# Load balancer name a variable
variable "load_balancer_name" {
  description = "making target group name a variable"
  default     = "Rennie-Alb"
  type        = string
}


# Load balancer ip_address_type a variable
variable "ip_address_type" {
  description = "making alb ip_address_type a variable"
  default     = "ipv4"
  type        = string
}

# Load balancer type a variable
variable "load_balancer_type" {
  description = "making load_balancer_type a variable"
  default     = "application"
  type        = string
}

# Internal facing Load balancer variable
variable "internal" {
  description = "making internal facing a variable"
  default     = false
  type        = bool

}

#Deletion protection variable
variable "enable_deletion_protection" {
  description = "making enable_deletion_protection a variable"
  default     = false
  type        = bool

}


#RDS VARIABLES

variable "rds_mysql_subnet_group_name" {
  description = "making rds_mysql_subnet_group_name a variable"
  default     = "rds_mysql_subnet_group"
  type        = string
}

variable "mysql_allocated_storage" {
  description = "making mysql allocated_storage a variable"
  default     = 10
  type        = number
}

variable "mysql_db_name" {
  description = "making mysql db_name a variable"
  default     = "mydb"
  type        = string
}

variable "mysql_engine_version" {
  description = "making mysql engine_version a variable"
  default     = "8.0.28"
  type        = string
}

variable "mysql_instance_class" {
  description = "making mysql instance_class a variable"
  default     = "db.t3.micro"
  type        = string
}

variable "mysql_username" { #safer to keep in aws secret manager
  description = "making mysql username a variable"
  default     = "Rennie"
  type        = string
}

variable "mysql_password" { #safer to keep in aws secret manager
  description = "making mysql password a variable"
  default     = "wordpass"
  type        = string
}

variable "mysql_storage_type" {
  description = "making mysql storage_type a variable"
  default     = "gp2"
  type        = string
}

variable "mysql_publicly_accessible" {
  description = "making mysql publicly_accessible a variable"
  default     = false
  type        = bool
}

variable "mysql_skip_final_snapshot" {
  description = "making mysql skip_final_snapshot a variable"
  default     = true
  type        = bool
}

variable "multi-az-deployment" {
  description = "create a standby DB instance"
  default     = false
  type        = bool
}
variable "project_sql_name" {
  description = "making db instance name a variable"
  default     = "project_sql"
  type        = string
}

