variable "vpc_id" {
    description         = "ID of the VPC"
    type                     = string
}

variable "vpc_cidr_block" {
    description = "The CIDR block of the VPC"
    type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access to public instances"
  type        = string
  default     = "0.0.0.0/0" 
}

variable "public_ec2_sg_name" {
    description = "Name of the public EC2 instance"
    type            = string
    default        = "SecurityGroupPublic"
}

variable "private_ec2_sg_name" {
    description = "Name of the private EC2 instance"
    type            = string
    default        = "SecurityGroupPrivate"
}

variable "default_sg_name" {
    description = "Name of the default security group"
    type            = string
    default        = "DefaultSecurityGroup"
}