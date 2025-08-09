provider "aws" {
  
}
resource "aws_db_subnet_group" "name" {
    subnet_ids = [ "subnet-0d690742a3b3633f6","subnet-0ef67f07ab4abcba1" ]
    tags = {
      Name = "dev-SG"
    }
  
}
resource "aws_security_group" "name" {
    vpc_id = "vpc-01a46bf24a9414086"
    tags = {
      Name = "DEV-RDS-SG"
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

    resource "aws_db_instance" "dev_rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "devdb"
  username               = "admin"
  password               = "StrongPassw0rd!"
  skip_final_snapshot    = true
  publicly_accessible    = true
  backup_retention_period = 7 

  db_subnet_group_name   = aws_db_subnet_group.name.name 
  vpc_security_group_ids = [aws_security_group.name.id]
  depends_on = [ aws_db_subnet_group.name ]

  tags = {
    Name = "dev-rds"
  }
}

resource "aws_db_instance" "read_replica" {
  replicate_source_db  = aws_db_instance.dev_rds.identifier
  instance_class       = "db.t3.micro"
  publicly_accessible  = true
  skip_final_snapshot  = true

  tags = {
    Name = "dev-rds-replica"
  }
}


