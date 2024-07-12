output "aws_instance_public" {
  value = aws_instance.devd3.public_ip
  description = "passing value of the public ip"

}
output "private_ip" {
    value = aws_instance.devd3.private_ip
    description = "passign value of private ip"
    sensitive = true
  
}