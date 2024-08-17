resource "aws_vpc" "muguntha" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        name = "muguntha_vpc"
    }

  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.muguntha.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true

  
}

resource "aws_subnet" "private" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.muguntha.id
   
  
}

resource "aws_internet_gateway" "all" {
    vpc_id = aws_vpc.muguntha.id
  
}
  


resource "aws_route_table" "all" {
    vpc_id = aws_vpc.muguntha.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.all.id
        
    }
  
}

resource "aws_route_table_association" "all" {
     subnet_id = aws_subnet.public.id
     route_table_id = aws_route_table.all.id
  
}