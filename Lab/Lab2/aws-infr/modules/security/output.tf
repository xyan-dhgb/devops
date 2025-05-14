output "public_sg_id" {
    description = "The ID of the public security group"
    value       = aws_security_group.public_ec2_sg.id
}

output "private_sg_id" {
    description = "The ID of the private security group"
    value       = aws_security_group.private_ec2_sg.id
}

output "private_ec2_sg_name" {
    description = "The name of the private EC2 security group"
    value       = aws_security_group.private_ec2_sg.name
}

output "default_sg_name" {
    description = "The name of the default security group"
    value       = aws_security_group.default_sg.name
}