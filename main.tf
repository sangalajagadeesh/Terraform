provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "demo-instance" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name      = "Ohio"
  associate_public_ip_address = true
}