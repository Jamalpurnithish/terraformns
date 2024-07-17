resource "aws_instance" "kali" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    tags = {
        Name = "nsbfdfdf"
    }

    lifecycle {
   create_before_destroy = true
    }

}




