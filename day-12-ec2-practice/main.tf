resource "aws_instance" "kaju" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
        Name = "ka-ec2"
    }
  
}

