module "bittu" {
    source = "github.com/CloudTechDevOps/Terraform-09-00am/day-2-basic_code_ec2"
    ami_id = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "04-07KEYPAIR"
  
}
