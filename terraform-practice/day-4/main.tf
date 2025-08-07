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
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.name.id
  
}