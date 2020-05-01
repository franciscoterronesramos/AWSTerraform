resource "aws_instance" "webservers" {
  ami = lookup(var.amis,var.region )
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  subnet_id = aws_subnet.priv1.id
  count = 2
}

