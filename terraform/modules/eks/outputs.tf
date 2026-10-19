output "cluster_name" {
  value       = aws_eks_cluster.main.name
  description = "The name of the EKS Cluster"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "The endpoint URL for the EKS Cluster Control Plane"
}

output "cluster_certificate_authority_data" {
  value       = aws_eks_cluster.main.certificate_authority[0].data
  description = "The CA data needed to authenticate with the cluster"
}
