
resource "aws_vpc" "new_vpc" {
  cidr_block = var.ntier-vpc
  tags = {
    Name = "aws-vpc"
  }

}
resource "aws_subnet" "my-subnet1" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = var.ntier-subnet
  tags       = { Name = "ntier-subnet" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "igw"
  }
}


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my-subnet1.id
  route_table_id = aws_route_table.rt.id
}



resource "aws_security_group" "sg" {
  name        = "allow_ports"
  description = "allow ports"
  vpc_id      = aws_vpc.new_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
}
# resource "aws_key_pair" "deployer" {
# key_name   = "deployer-key"
 # public_key = file(var.public_key)
#}

resource "aws_instance" "ec2" {
  ami                         = "ami-03f65b8614a860c29"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "Master"
  user_data                   = file("tomcat9.sh")
  subnet_id                   = aws_subnet.my-subnet1.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  tags                        = { Name = "AWS" }

}






 