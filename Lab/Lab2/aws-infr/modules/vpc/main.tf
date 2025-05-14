# VPC consists of Public and Private Subnets, NAT Gateway, and Internet Gateway, Public and Private Route Table

# Create VPC
resource "aws_vpc" "main" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = true
    enable_dns_hostnames    = true
    tags = {
        Name = "VPC-${var.vpc_name}"
    }
}

# Create Public Subnet
resource "aws_subnet" "public" {
    vpc_id             = aws_vpc.main.id
    cidr_block         = var.public_subnet_cidr
    availability_zone  = var.az[0]
    tags = {
        Name = "PublicSubnet-${var.public_subnet_name}"
    }
}

# Create Private Subnet
resource "aws_subnet" "private" {
    vpc_id             = aws_vpc.main.id
    cidr_block         = var.private_subnet_cidr
    availability_zone  = var.az[1]
    tags = {
        Name = "PrivateSubnet-${var.private_subnet_name}"
    }
}

# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "InternetGateway-${var.internet_gateway_name}"
    }
}

# Create Elastic IP (eip) for NAT Gateway
resource "aws_eip" "nat" {
    domain = "vpc"
    tags = {
        Name = "ElasticIP-${var.elastic_ip_for_nat}"
    }
}

# Create NAT Gateway
resource "aws_nat_gateway" "natgw" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public.id
    tags = {
        Name = "NATGateway-${var.nat_gateway_name}"
    }
}

# Create Public Route Table
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
    tags = {
        Name = "PublicRouteTable-${var.public_route_table_name}"
    }
}

# Create Private Route Table
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw.id
    }
    tags = {
        Name = "PrivateRouteTable-${var.private_route_table_name}"
    }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private" {
    subnet_id      = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}