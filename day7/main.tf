resource "aws_instance" "deve" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    availability_zone= "ap-south-1b"
    tags = {
      Name = "mango"
    }
    lifecycle {
      create_before_destroy = true
    }
  
}
