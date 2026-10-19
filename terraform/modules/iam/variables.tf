variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
