resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "App Instance"
  }
}
