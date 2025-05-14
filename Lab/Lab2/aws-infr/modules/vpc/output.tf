output "vpc_id" {
    description     = "Output of VPC ID"
    value               = aws_vpc.main.id
}

output "public_subnet_id" {
    description   = "Output of Public Subnet ID"
    value               = aws_subnet.public.id
}

output "private_subnet_id" {
    description  = "Output of Private Subnet ID"
    value            = aws_subnet.private.id
}

output "vpc_cidr_block" {
    description  = "Output of CIDR Block"
    value           = aws_vpc.main.cidr_block
}


output  "public_route_table_id" {
    description  = "Output of Public Route Table ID"
    value           = aws_route_table.public.id
}

output "private_route_table_id" {
    description  = "Output of Private Route Table ID"
    value           = aws_route_table.private.id
}