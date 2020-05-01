output "server-ip" {
  value = aws_instance.web-server.public_ip
}
output "sever-type" {
  value = aws_instance.web-server.instance_type
}
output "server-ami" {
  value = aws_instance.web-server.ami
}
output "server-keypair" {
  value = aws_instance.web-server.key_name
}
output "server-vpcid" {
  value = aws_instance.web-server.vpc_security_group_ids
}
output "server_azs" {
  value = data.aws_availability_zones.az.names
}
output "userdata" {
  value = data.template_file.userdata.rendered
}