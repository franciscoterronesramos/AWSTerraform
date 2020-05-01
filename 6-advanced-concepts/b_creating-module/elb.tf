resource "aws_elb" "elb-web" {
  #name = "${var.environment}-${var.project}"
  name_prefix = "${var.environment}-"
  cross_zone_load_balancing = true
  subnets = [module.vpc.sub_pub1, module.vpc.sub_pub2]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  security_groups = [aws_security_group.elb-sg.id]

}