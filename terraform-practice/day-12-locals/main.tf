provider "aws" {
  
}
locals {
  region        = "us-east-1"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0861f4e788f5069dd"
  instance_type = local.instance_type
  tags = {
    Name = "App-${local.region}"
  }
}