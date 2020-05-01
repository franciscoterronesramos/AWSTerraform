variable "instance_type" {
  default = "t2.micro"
}
variable "region" {
  default = "eu-west-2"
}
variable "amis" {
  default = {
    eu-west-2 = "ami-0cb790308f7591fa6"
    eu-west-1 = "ami-04d5cc9b88f9d1d39"
    eu-central-1 = "ami-0ec1ba09723e5bfac"
  }
}
variable "aws_ctaid" {
  default = "515327903227"
}
variable "project" {
  default = "project-web"
}
variable "environment" {
  default = "PROD"
}