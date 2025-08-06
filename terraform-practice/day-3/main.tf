resource "aws_instance" "steve" {
    ami ="ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    
  
}
resource "aws_instance" "jack" {
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
  
}