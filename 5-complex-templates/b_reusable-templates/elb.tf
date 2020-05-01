data "aws_availability_zones" "az" {
}
resource "aws_elb" "elb-web" {
  #name = "${var.environment}-${var.project}"
  name_prefix = "${var.environment}-"

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  availability_zones = data.aws_availability_zones.az.names
}