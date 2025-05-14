variable "aws_regions" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "ap-southeast-2"
}

variable "cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type        = string
    default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR block for the private subnet"
    type        = string
    default     = "10.0.2.0/24"
}

variable "az" {
    description = "List of availability zones"
    type        = list(string)
    default     = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "tags" {
    description = "Tags for resources"
    type        = map(string)
    default     = {
        Environment = "Dev"
        Project     = "AWS-Infrastructure"
    }
}

variable "key_name" {
    description = "Key pair name for EC2 instances"
    type        = string
}

variable "ami_id" {
    description = "AMI ID for EC2 instances"
    type        = string
}

variable "instance_type" {
    description = "Instance type for EC2 instances"
    type        = string
    default     = "t2.micro"
}

variable "public_sg_id" {
    description = "Security group ID for public instances"
    type        = string
}

variable "private_sg_id" {
    description = "Security group ID for private instances"
    type        = string
}

variable "public_instance_name" {
    description = "Name for the public EC2 instance"
    type        = string
    default     = "PublicInstance"
}

variable "private_instance_name" {
    description = "Name for the private EC2 instance"
    type        = string
    default     = "PrivateInstance"
}

variable "public_ec2_sg_name" {
    description = "Name of the public EC2 security group"
    type        = string
    default     = "PublicEC2SecurityGroup"
}

variable "allowed_ssh_cidr" {
    description = "CIDR block allowed for SSH access to public instances"
    type        = string
    default     = "0.0.0.0/0"  
}