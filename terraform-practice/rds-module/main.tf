module "rds" {
  source  = "github.com/terraform-aws-modules/terraform-aws-rds?ref=v6.5.3"

  identifier              = var.db_identifier
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage

  db_name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port
 family     = "mysql8.0"
  major_engine_version  = "8.0"
  publicly_accessible     = var.db_publicly_accessible
  vpc_security_group_ids  = var.vpc_security_group_ids
  subnet_ids              = var.subnet_ids

  skip_final_snapshot     = true
}
