module "kaja" {
    source = "../day-12-ec2-practice"
    ami_id = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t3.micro"
    key_name = "09-06KEYPAIR"
  
}

