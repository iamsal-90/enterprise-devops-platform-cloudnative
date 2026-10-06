output "bastion_sg_id" {
  value       = aws_security_group.bastion.id
  description = "The ID of the Bastion Security Group"
}

output "internal_sg_id" {
  value       = aws_security_group.internal.id
  description = "The ID of the Internal Core Security Group"
}
