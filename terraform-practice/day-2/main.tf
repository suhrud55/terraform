resource "aws_instance" "steve" {
    ami = var.ami-id
    instance_type = var.instance_type
  
}