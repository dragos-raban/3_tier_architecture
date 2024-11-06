resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Web Instance"
  }
}
