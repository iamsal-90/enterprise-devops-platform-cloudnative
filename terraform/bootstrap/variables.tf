variable "project_name" {
  description = "Project prefix used for naming AWS resources"
  type        = string
  default     = "edp"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)

  default = {
    Project   = "Enterprise DevOps Platform"
    ManagedBy = "Terraform"
    Owner     = "DevOps"
  }
}
