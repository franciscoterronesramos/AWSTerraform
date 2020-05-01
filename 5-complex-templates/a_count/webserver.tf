resource "aws_instance" "webservers" {
  ami = lookup(var.amis,var.region )
  instance_type = var.instance_type
  count = 1
}

