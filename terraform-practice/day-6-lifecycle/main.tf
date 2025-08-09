provider "aws" {
  
}
resource "aws_instance" "name" {
    ami = "ami-0144277607031eca2"
    instance_type = "t2.micro"
    tags = {
      Name = "dev"
    }
    lifecycle {
      ignore_changes = [ tags ]
      prevent_destroy = false
      create_before_destroy = true
    }
    
  
}
 