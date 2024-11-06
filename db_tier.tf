resource "aws_db_instance" "db" {
  identifier        = "mydb"
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  db_name           = "mydb"
  username          = "admin"
  password          = "mysecurepassword"
  #subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  multi_az        = false
  publicly_accessible = false
  storage_type    = "gp2"
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.private_subnet.id]

  tags = {
    Name = "DB Subnet Group"
  }
}
