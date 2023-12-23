# Create a new VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

# Create subnets - iterate over the subnet CIDR blocks
resource "aws_subnet" "my_subnet" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = element(var.aws_availability_zones, count.index)

  tags = {
    Name = "my-subnet-${count.index + 1}"
  }
}

# Create a security group for the ECS tasks
resource "aws_security_group" "ecs_sg" {
  name        = var.security_group_name
  description = "Security group for ECS tasks"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rules as needed, e.g., allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}
