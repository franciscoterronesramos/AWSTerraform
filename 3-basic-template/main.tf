terraform {
  required_version = "0.12.24"
}
provider "aws" {
  region = "eu-west-2"
  allowed_account_ids = [515327903227]
  profile = "default"
}
