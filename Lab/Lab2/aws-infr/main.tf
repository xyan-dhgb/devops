provider "aws" {
    region = var.aws_regions
}

# VPC Module
module "vpc" {
    source              = "./modules/vpc"
    vpc_cidr            = var.cidr_block
    public_subnet_cidr  = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    az                              = var.az
}

# EC2 Module
module "ec2" {
    source              = "./modules/ec2"
    public_subnet_id    = module.vpc.public_subnet_id
    private_subnet_id   = module.vpc.private_subnet_id
    public_sg_id        = module.security.public_sg_id
    private_sg_id       = module.security.private_sg_id 
    instance_type       = var.instance_type
    key_name            = var.key_name
    public_instance_name = var.public_instance_name
    private_instance_name = var.private_instance_name
}

# Security Module
module "security" {
    source = "./modules/security"
    vpc_id         = module.vpc.vpc_id
    vpc_cidr_block = module.vpc.vpc_cidr_block
    allowed_ssh_cidr =  var.allowed_ssh_cidr
    # Ensure VPC is created first
    depends_on = [module.vpc]
}