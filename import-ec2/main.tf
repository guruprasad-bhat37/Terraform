provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_imported_ec2_instance" {
  ami           = "i-0ad6baef6818e8b23" 
  instance_type = "t2.micro" 
}