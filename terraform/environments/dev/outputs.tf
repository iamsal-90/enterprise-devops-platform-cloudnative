output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the Dev VPC"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "List of Public Subnet IDs in Dev"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "List of Private Subnet IDs in Dev"
}
output "bastion_sg_id" {
  value       = module.security.bastion_sg_id
  description = "The ID of the Bastion Security Group in Dev"
}

output "internal_sg_id" {
  value       = module.security.internal_sg_id
  description = "The ID of the Internal Security Group in Dev"
}

output "eks_cluster_role_arn" {
  value       = module.iam.eks_cluster_role_arn
  description = "EKS Cluster IAM Role ARN in Dev"
}

output "eks_node_role_arn" {
  value       = module.iam.eks_node_role_arn
  description = "EKS Worker Nodes IAM Role ARN in Dev"
}
