variable "vpc_cidr" {
    description           = "CIDR Value for VPC"
    type                      = string
    default                  = "10.0.0.0/16"
}

variable "vpc_name" {
    description            = "Name of VPC" 
    type                        = string
    default                   = "MyVPC"  
}

variable "public_subnet_cidr" {
    description             = "CIDR value for Public Subnet"
    type                         = string
    default                     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description              = "CIDR value for Private Subnet"
    type                          = string    
    default                     = "10.0.2.0/24"
}

variable "public_subnet_name" {
    description      = "Name of Public Subnet"
    type                  = string
    default              = "PublicSubnet"
}

variable "private_subnet_name" {
    description       = "Name of Private Subnet"
    type                  = string
    default              = "PrivateSubnet"
}

variable "internet_gateway_name" {
    description         = "Name of Internet Gateway"
    type                     = string
    default                = "InternetGateway"
}

variable "elastic_ip_for_nat" {
    description         = "Elastic IP Value for Nat Gateway"
    default                = "ElasticIP"
}

variable "nat_gateway_name" {
    description           = "Name of Nat Gateway"
    default                  = "NATGateway" 
}

variable "public_route_table_name"{
    description         = "Name for Public Route Table"
    type                     = string  
    default                = "PublicRouteTable"
}

variable "private_route_table_name" {
    description        = "Name for Private Route Table"
    type                   = string
    default              = "PrivateRouteTable"
}

variable "az" {
    description       = "Value for Availability Zone"
    type                  =  list(string)
    default             = ["ap-southeast-2a",  "ap-southeast-2b", "ap-southeast-2c"] 
}

