provider "aws" {
  
}


resource "aws_key_pair" "kintu" {
    key_name = "17-07KEYPAIR"
    public_key = file("~/.ssh/id_rsa.pub")
  
}


resource "aws_instance" "timeout" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = aws_key_pair.kintu.id
  
connection {
  type = "ssh"
  user = "ec2-user"
  private_key = file("~/.ssh/id_rsa")
  host = self.public_ip
}

provisioner "local-exec" {
    command = "touch bantu"

}

provisioner "file" {
    source = "bantu"
    destination = "/home/ec2-user/bantu"
  
}
provisioner "remote-exec" {
    inline = [ 
        "touch babu"
         ] 
}
  
}

