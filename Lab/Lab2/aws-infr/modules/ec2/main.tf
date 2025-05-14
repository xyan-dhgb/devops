# Create Public EC2
resource "aws_instance" "public_instance" {
    ami                                         = var.ami_id
    instance_type                       = var.instance_type
    subnet_id                              = var.public_subnet_id
    vpc_security_group_ids      = [var.public_sg_id]
    key_name                              = var.key_name
    tags = {
        Name = "PublicInstance-${var.public_instance_name}"
    }
}

# Create Private EC2
resource "aws_instance" "private_instance" {
    ami                                             = var.ami_id
    instance_type                           = var.instance_type
    subnet_id                                  = var.private_subnet_id
    vpc_security_group_ids          = [var.private_sg_id]
    key_name                                  = var.key_name
    tags = {
        Name = "PrivateInstance-${var.private_instance_name}"
    }
}