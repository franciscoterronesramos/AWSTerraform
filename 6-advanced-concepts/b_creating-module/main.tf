terraform {
  required_version = "0.12.24"
  backend "s3" {
    bucket = "tuntun"
    region = "eu-west-2"
    key = "states-tfstate"
    dynamodb_table = "tuntun"
    profile = "default"
  }
}
provider "aws" {
  region = var.region
  allowed_account_ids = [var.aws_ctaid]
}
data "aws_availability_zones" "az" {
}
module "vpc" {
  source = "./modules/vpc"
}