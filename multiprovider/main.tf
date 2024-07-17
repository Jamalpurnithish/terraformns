# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "ap-south-1"
}

#Another provider alias 
provider "aws" {
  region = "us-east-1"
  alias = "america"
}
provider "aws" {
  region = "us-east-2"
  alias = "africa"
}

resource "aws_s3_bucket" "test" {
  bucket = "del-hyd-nareshgg-it"

}
resource "aws_s3_bucket" "test2" {
  bucket = "del-hyd-nareeesh-it-test2"
  provider = aws.africa  #provider.value of alias
  
}
resource "aws_s3_bucket" "test3" {
  bucket = "del-hyd-naresh-it-test223"
  provider = aws.america  #provider.value of alias
  
}