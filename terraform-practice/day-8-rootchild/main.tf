module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = "10.0.0.0/16"
  subnet1_cidr  = "10.0.11.0/24"
  subnet2_cidr  = "10.0.2.0/24"
  az1           = var.az1
  az2           = var.az2
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id  # Replace with valid AMI
  instance_type = var.instance_type
  subnet1_id     = module.vpc.subnet1_id   # using one subnet for EC2
}


module "rds" {
  source         = "./modules/rds"
  subnet_ids      = module.vpc.subnet_ids
  instance_class = "db.t3.micro"
  db_name        = "mydb"
  db_user        = "admin"
  db_password    = "Admin12345"
}