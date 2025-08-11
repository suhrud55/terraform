aws_region            = "ap-south-1"

db_identifier         = "my-rds-db"
db_engine             = "mysql"
db_engine_version     = "8.0"
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20

db_name               = "mydatabase"
db_username           = "admin"
db_password           = "MyStrongPassword123"
db_port               = 3306

db_publicly_accessible = false

vpc_security_group_ids = ["sg-09bb6c69f645dc76d"]
subnet_ids             = ["subnet-0ef67f07ab4abcba1", "subnet-0d690742a3b3633f6"]

