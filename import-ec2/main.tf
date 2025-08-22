provider "aws" {
  region = "ap-south-1"
  
}

resource "aws_instance" "my_imported_instance" {
    instance_type ="t2.micro"
    ami = "i-0fe3838e1633a0053"
}


# Run below command in Terminal
# terraform import aws_instance.my_imported_instance i-0fe3838e1633a0053