provider "aws" {
  
}
resource "aws_instance" "name" {
    ami = "ami-0144277607031eca2" 
    instance_type = "t2.micro"
}

resource "aws_s3_bucket" "name" {
    bucket = "jagudshghgishgirhs"
  
}