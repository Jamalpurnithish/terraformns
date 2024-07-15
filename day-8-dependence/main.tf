resource "aws_instance" "ora" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "04-07KEYPAIR"
  
}

resource "aws_s3_bucket" "sbsb" {
    bucket = "kllkdkvdkivd"
    depends_on = [ aws_instance.ora ]
  
}