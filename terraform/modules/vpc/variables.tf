variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "Base CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets (Exactly 3)"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets (Exactly 3)"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to deploy into"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
