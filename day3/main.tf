# Create VPC and attach to IG
resource "aws_vpc" "devd3" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "nithish"
    }
  
}
# Create IG and attach to VPC
resource "aws_internet_gateway" "devd3" {
    vpc_id = aws_vpc.devd3.id
  
}
# Create subnets
resource "aws_subnet" "devd3"{
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.devd3.id
    
}
# Create route table and provide path IG to RT (edit route)
resource "aws_route_table" "devd3" {
    vpc_id = aws_vpc.devd3.id
    route {
        cidr_block = "0.0.0.0/10"
        gateway_id = aws_internet_gateway.devd3.id  
        }
}
# Create associate RT to subnet
resource "aws_route_table_association" "devd3" {
    route_table_id = aws_route_table.devd3.id
    subnet_id = aws_subnet.devd3.id
  
}
#Create security groups
resource "aws_security_group" "devd3" {
    vpc_id = aws_vpc.devd3.id

    ingress {
        description = "TLS from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }

}
resource "aws_instance" "devd3" {
    ami = "ami-01376101673c89611"
    instance_type = "t3.micro"
    key_name = "04-07KEYPAIR"
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.devd3.id ]
    subnet_id = aws_subnet.devd3.id
    tags = {
        Name = "mango"
    } 
}



