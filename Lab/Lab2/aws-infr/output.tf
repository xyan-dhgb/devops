output "vpc_id" {
    description     = "Output of VPC ID"
    value               = module.vpc.vpc_id
}

output "public_subnet_id" {
    description   = "Output of Public Subnet ID"
    value               = module.vpc.public_subnet_id
}

output "private_subnet_id" {
    description  = "Output of Private Subnet ID"
    value            = module.vpc.private_subnet_id
}

output "private_instance_id" {
    description = "Output of Private Instance ID"
    value       = module.ec2.private_instance_id
}

output "public_instance_id" {
    description = "Output of Public Instance ID"
    value       = module.ec2.public_instance_id
}

output "private_ec2_sg_name" {
    description = "The name of the private EC2 security group"
    value       = module.security.private_ec2_sg_name
}

output "default_sg_name" {
    description = "The name of the default security group"
    value       = module.security.default_sg_name
}

output "ssh_command" {
    description = "SSH command to connect to the public instance"
    value       = "ssh -i ${var.key_name}.pem ec2-user@${module.ec2.public_instance_public_ip}"
}

output "jumpbox_command" {
    description = "SSH command to connect to the private instance from the public instance"
    value       = "ssh -i ${var.key_name}.pem ec2-user@${module.ec2.private_instance_private_ip}"
}

output "public_instance_public_ip" {
    description = "Public IP of the public instance"
    value       = module.ec2.public_instance_public_ip
}

output "public_instance_private_ip" {
    description = "Private IP of the public instance"
    value       = module.ec2.public_instance_private_ip
}

output "private_instance_private_ip" {
    description = "Private IP of the private instance"
    value       = module.ec2.private_instance_private_ip
}