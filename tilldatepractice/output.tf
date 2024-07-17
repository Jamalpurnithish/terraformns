output "public_ip" {
    value = aws_instance.psvp.public_ip
    description = "passing the value of the public ip"
  
}

output "private_ip" {
    value = aws_instance.psvp.private_ip
    description = "passing the value of private ip"
    sensitive = true
}
