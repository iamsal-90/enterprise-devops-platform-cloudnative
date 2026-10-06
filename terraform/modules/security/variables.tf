variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where security groups will be created"
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0" 
  description = "CIDR block allowed to SSH into the Bastion host"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
