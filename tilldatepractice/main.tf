#Create a VPC
resource "aws_vpc" "psvp" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "bfl"
    }
  
}

#Create IG and attach to VPC
resource "aws_internet_gateway" "psvp" {
    vpc_id = aws_vpc.psvp.id

}

#Create subnet
resource "aws_subnet" "psvp" {
    vpc_id = aws_vpc.psvp.id
    cidr_block = "10.0.0.0/24"

}

#Create route table and provide IG to RT (edit route)
resource "aws_route_table" "psvp" {
    vpc_id = aws_vpc.psvp.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.psvp.id
        }
  
}

#Create associate RT to subnet
resource "aws_route_table_association" "psvp" {
    route_table_id = aws_route_table.psvp.id
    subnet_id = aws_subnet.psvp.id

  
}

#Create security groups
resource "aws_security_group" "psvp" {
    vpc_id = aws_vpc.psvp.id

    ingress {
        description = "TLS from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "psvp" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t3.micro"
    key_name = "04-07KEYPAIR"
    tags = {
      Name = "tfnithish"
    }

    }
  
