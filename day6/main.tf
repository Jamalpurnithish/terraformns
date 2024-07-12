resource "aws_instance" "sani" {
  ami = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  key_name = "KEYPAIR"

}