resource "aws_instance" "test" {
    ami = "ami-0d54604676873b4ec"
    instance_type = "t2.micro"
  
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
  
}

resource "aws_s3_bucket" "name" {
    bucket = "showtiemmmmmm"
  
}