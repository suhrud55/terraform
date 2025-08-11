provider "aws" {
  
}
module "ec2-instance" {
  source         = "../day-7-modules"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_name  = var.instance_name
}
