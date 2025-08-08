resource "aws_s3_bucket" "tfstate" {
    bucket = "stevejack"

  
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cust-vpc"
      
    }
  
}
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "pub-sub"
    }
    cidr_block = "10.0.0.0/24"
  
}
resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name =  "pvt-sub"
    }
    cidr_block = "10.0.1.0/24"
  
}
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "cust-igw"
    }
  
}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
   
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
      }
    tags = {
      Name = "pub-rt"
    }
    
  
}
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
  
}

resource "aws_security_group" "test" {
    vpc_id = aws_vpc.name.id
    name = "test"
    tags = {
      Name = "test-sg"
    }

    ingress {
        from_port = 22
        to_port  = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  
}
     ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
     }
     egress {
         from_port        = 0
         to_port          = 0
         protocol         = "-1" #all protocols 
         cidr_blocks      = ["0.0.0.0/0"]

     }
}
resource "aws_eip" "nat-eip" {
    domain = "vpc"
  
}
resource "aws_nat_gateway" "name" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.name.id
    depends_on = [ aws_internet_gateway.name ]
    tags = {
      Name = "my-nat"
    }
  
}
resource "aws_route_table" "name5" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "pvt-rt"
    }
    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.name.id
    }

}
resource "aws_route_table_association" "pvt" {
    subnet_id = aws_subnet.name2.id
    route_table_id = aws_route_table.name5.id

  
}
resource "aws_instance" "pub" {
    ami = "ami-0d54604676873b4ec"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.test.id]
  
}

