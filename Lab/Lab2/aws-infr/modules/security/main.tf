resource "aws_security_group" "public_ec2_sg" {
    name        = var.public_ec2_sg_name
    vpc_id      = var.vpc_id
    description = "Security group for public EC2 instances"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.allowed_ssh_cidr]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "private_ec2_sg" {
    name        = var.private_ec2_sg_name
    vpc_id      = var.vpc_id
    description = "Security group for private EC2 instances"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "default_sg" {
    name        = var.default_sg_name
    vpc_id      = var.vpc_id
    description = "Default security group"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.vpc_cidr_block]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
