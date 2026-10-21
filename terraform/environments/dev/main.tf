module "vpc" {
  source = "../../modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  availability_zones   = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
module "security" {
  source = "../../modules/security"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = "0.0.0.0/0" 

  tags = {
    Infrastructure = "Core"
    Owner          = "DevOps-Team"
  }
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

  tags = {
    Infrastructure = "Core"
    Owner          = "DevOps-Team"
  }
}

module "eks" {
  source = "../../modules/eks"

  project_name     = var.project_name
  environment      = var.environment
  cluster_version  = "1.37"

  
  subnet_ids       = module.vpc.private_subnet_ids

  
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  instance_types   = ["t3.small"]
  desired_size     = 4
  max_size         = 5
  min_size         = 3

  tags = {
    Infrastructure = "Kubernetes"
    Owner          = "DevOps-Team"
  }
}

module "argocd" {
  source = "../../modules/argocd"

  environment = var.environment

  depends_on = [
    module.eks
  ]
}
