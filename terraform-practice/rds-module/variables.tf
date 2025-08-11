variable "aws_region" {
  description = "AWS region to deploy RDS"
  type        = string
}

variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Master DB username"
  type        = string
}

variable "db_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Database port"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Whether the DB should be publicly accessible"
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "List of VPC Security Group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}
