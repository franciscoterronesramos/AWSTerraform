resource "aws_launch_configuration" "webserver" {
  name_prefix = "web-server-"
  image_id = lookup(var.amis, var.region )
  instance_type = var.instance_type
  key_name = "devops"
  security_groups = [aws_security_group.web-sg.id]
  user_data = file("templates/userdata.tpl")
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "as-web" {
  name = aws_launch_configuration.webserver.name  
  launch_configuration = aws_launch_configuration.webserver.name
  max_size = 1
  min_size = 1
  load_balancers = [aws_elb.elb-web.id]
  vpc_zone_identifier = [aws_subnet.pub1.id, aws_subnet.pub2.id]
  wait_for_elb_capacity = 1
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "webserver"
  }
}

