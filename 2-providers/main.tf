terraform {
  required_version = "0.12.24"
}
provider "aws" {
  region = "eu-west-2"
  allowed_account_ids = [515327903227]
  profile = "default"
}
resource "aws_vpc" "vpc" {
  cidr_block = "10.8.0.0/16"
  enable_dns_hostnames = false
  enable_dns_support = false
}