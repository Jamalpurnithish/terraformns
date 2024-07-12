data "aws_subnet" "sbnas" {
    filter {
      name = "tag:Name"
      values = ["newsss"]
    }
  
}

resource "aws_instance" "updown" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "04-07KEYPAIR"
    subnet_id = data.aws_subnet.sbnas.id
    tags = {
      Name = "datasoure-instance"
    }
  
}

