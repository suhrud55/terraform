variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "The Name tag for the instance"
  type        = string
}
