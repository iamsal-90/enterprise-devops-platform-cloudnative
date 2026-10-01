# Software Architecture Document (SAD) - Enterprise DevOps Platform (EDP)

## 1. Vision & Goals
Building a production-like, highly available, and scalable DevOps platform on AWS to host containerized microservices using modern GitOps and IaC practices.

## 2. Infrastructure & Network Design
- **AWS Region:** eu-central-1 (Frankfurt)
- **VPC CIDR:** 10.0.0.0/16
- **Architecture Flow:** Internet -> IGW -> Public Subnets (ALB/Bastion) -> NAT Gateway -> Private Subnets (EKS Worker Nodes / Pods)

### Subnet Layout
- Public A/B/C: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24
- Private A/B/C: 10.0.11.0/24, 10.0.12.0/24, 10.0.13.0/24

## 3. Core Architecture Decisions (ADR Summary)
- **ADR-001:** Monorepo for simplified versioning and portfolio clarity.
- **ADR-002:** GitOps-driven delivery via ArgoCD (Jenkins does not touch the K8s cluster directly).
- **ADR-003:** Infrastructure as Code (IaC) strictly via Terraform Modules.
