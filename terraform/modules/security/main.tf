# 1. Bastion Host Security Group
resource "aws_security_group" "bastion" {
  name        = "${var.project_name}-bastion-sg-${var.environment}"
  description = "Security group for Bastion Host / Jump Box"
  vpc_id      = var.vpc_id

  # Ingress: Allow SSH from allowed IP range
  ingress {
    description = "Allow SSH from trusted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # Egress: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-bastion-sg-${var.environment}"
  })
}

# 2. Internal Core Security Group
resource "aws_security_group" "internal" {
  name        = "${var.project_name}-internal-sg-${var.environment}"
  description = "Security group for internal cluster and app traffic"
  vpc_id      = var.vpc_id

  # Ingress: Allow all internal traffic from the same Security Group
  ingress {
    description = "Allow self internal traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  # Egress: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-internal-sg-${var.environment}"
  })
}
