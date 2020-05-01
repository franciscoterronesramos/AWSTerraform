data "aws_availability_zones" "az" {

}
data "aws_ami" "linuxamazonlatest" {
most_recent = true
owners = ["137112412989"] # Canonical

  filter {
      name   = "name"
      values = ["amzn2-ami-hvm-2.0.20200304.0-*"]
  }
  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}
data "template_file" "userdata" {
  template = file("templates/userdata.tpl")
  vars = {
   pkg_srv_web = "httpd"
  }
}
resource "aws_instance" "web-server" {
  ami = data.aws_ami.linuxamazonlatest.id
  instance_type = var.instance_type
  user_data = data.template_file.userdata.rendered
}