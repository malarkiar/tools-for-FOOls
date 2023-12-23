# AWS Region
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-west-2"
}

# ECS Cluster Name
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "my-cluster"
}

# ECS Task Definition
variable "ecs_task_family" {
  description = "The family name of the ECS task definition"
  type        = string
  default     = "my-task"
}

# ECS Task CPU and Memory
variable "ecs_task_cpu" {
  description = "The number of CPU units used by the task"
  type        = string
  default     = "256"
}

variable "ecs_task_memory" {
  description = "The amount of memory used by the task (in MiB)"
  type        = string
  default     = "512"
}

# Docker Image for ECS Task
variable "docker_image_url" {
  description = "The URL of the Docker image to use in the ECS task"
  type        = string
  default     = "my-app-image-url" # Replace with your actual image URL
}

# VPC and Subnet Configuration
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]  # Modify as needed
}

variable "subnet_cidr_blocks" {
  description = "The list of CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Modify as needed
}

# Security Group Configuration
variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-service"
}

variable "security_group_name" {
  description = "The name of the security group for the ECS service"
  type        = string
  default     = "ecs-security-group"
}

# Add more variables as required for your configuration
