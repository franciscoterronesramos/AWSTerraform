resource "aws_db_subnet_group" "subnet-groups" {
  subnet_ids = [aws_subnet.priv1.id, aws_subnet.priv2.id]
}
resource "aws_db_instance" "mydb" {
  instance_class = "db.t2.micro"
  identifier = "mydb"
  username = var.rds_username
  password = var.rds_password
  engine = "mysql"
  allocated_storage = 10
  storage_type = "gp2"
  multi_az = false
  db_subnet_group_name = aws_db_subnet_group.subnet-groups.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  publicly_accessible = true
  skip_final_snapshot = true
}