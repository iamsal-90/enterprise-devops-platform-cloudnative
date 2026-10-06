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
