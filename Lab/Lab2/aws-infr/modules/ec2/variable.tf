variable "ami_id" {
    description             = "AMI ID for the EC2 instance"
    type                        = string
    default                    = "ami-0f5d1713c9af4fe30"
}

variable "public_subnet_id" {
    description             = "Public subnet ID for the EC2 instance"
    type                        = string
}

variable "private_subnet_id" {
    description             = "Private subnet ID for the EC2 instance"
    type                        = string
}

variable "instance_type" {
    description             = "Instance type for the EC2 instance"
    type                        = string
    default                    = "t2.micro"
}

variable "public_sg_id" {
    description             = "Security group ID for the public EC2 instance"
    type                        = string
}

variable "private_sg_id" {
    description             = "Security group ID for the private EC2 instance"
    type                        = string
}

variable "key_name" {
    description             = "Key name for the EC2 instance"
    type                        = string
}

variable "public_instance_name" {
    description             = "Name for the public EC2 instance"
    type                        = string
    default                    = "PublicInstance"
}

variable "private_instance_name" {
    description             = "Name for the private EC2 instance"
    type                        = string
    default                    = "PrivateInstance"
}
