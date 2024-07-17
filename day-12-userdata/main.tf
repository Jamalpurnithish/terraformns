provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "babu" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "04-07KEYPAIR"
    user_data = file("test.sh")

    tags = {
        Name = "rapati"
    }
  
}
