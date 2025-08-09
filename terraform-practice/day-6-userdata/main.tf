provider "aws" {
  
}
resource "aws_instance" "name" {
    ami = "ami-0144277607031eca2" 
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-09bb6c69f645dc76d" ]
    user_data = file("test.sh")
    
    tags = {
      Name = "j"
    }
}
