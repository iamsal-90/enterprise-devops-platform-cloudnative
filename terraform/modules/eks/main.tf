# 1. AWS EKS Cluster (Control Plane)
resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-cluster-${var.environment}"
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true  
    endpoint_public_access  = true  
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-cluster-${var.environment}"
  })
}

# 2. EKS Managed Node Group (Worker Nodes)
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-node-group-${var.environment}"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types

    depends_on = [
    aws_eks_cluster.main
  ]

  tags = merge(var.tags, {
    Name = "${var.project_name}-node-group-${var.environment}"
  })
}
