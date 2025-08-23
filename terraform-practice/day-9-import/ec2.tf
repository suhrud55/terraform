resource "aws_instance" "name1" {
    ami = "ami-0861f4e788f5069dd"
    instance_type = "t2.micro"
    tags = {
      Name = "term"
    }
  
}
resource "aws_instance" "name2" {
  ami = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
  tags = {
    Name = "ter"
  }
  
}
resource "aws_instance" "name3" {
  ami = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
  tags = {
    Name = "te"
  }
  
}