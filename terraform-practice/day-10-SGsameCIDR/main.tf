variable "allowed_ports" {
  default = [22, 80, 443, 3306, 8080]
}

variable "cidr_source" {
  default = "0.0.0.0/0" # change to your CIDR, e.g. 0.0.0.0/0 for public
}

resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "SG allowing multiple ports from same CIDR"
  vpc_id      = "vpc-01a46bf24a9414086" # replace with your VPC ID

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      description = "Allow port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_source]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}
