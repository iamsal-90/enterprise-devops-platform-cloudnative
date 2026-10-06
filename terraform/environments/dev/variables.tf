variable "aws_region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS Region for Dev environment"
}

variable "project_name" {
  type        = string
  default     = "edp"
  description = "Project prefix name"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}
