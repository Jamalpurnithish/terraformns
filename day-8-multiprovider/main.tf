# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
    region = "ap-south-1"
  
}

#Anoter provider alias
provider "aws" {
    region = "us-east-1"
    alias = "usam"
  
}

resource "aws_s3_bucket" "tes1" {
    bucket = "jkklikdvdd"
  
}

resource "aws_s3_bucket" "test2" {
    bucket = "kdvkkdivdidv"
    provider = aws.usam

}
