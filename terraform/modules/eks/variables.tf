variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "cluster_version" {
  type        = string
  default     = "1.37"
  description = "Kubernetes version for EKS"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM Role ARN for the EKS Cluster Control Plane"
}

variable "node_role_arn" {
  type        = string
  description = "IAM Role ARN for the EKS Managed Node Group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of Private Subnet IDs where Worker Nodes will reside"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.small"]
  description = "Instance types for worker nodes"
}

variable "desired_size" {
  type        = number
  default     = 2
}

variable "max_size" {
  type        = number
  default     = 4
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "tags" {
  type        = map(string)
  default     = {}
}
