terraform {
  required_version = ">= 0.12, < 0.13"
}

variable "region" {
 default = "ap-southeast-1"
}
variable "shared_cred_file" {
 default = "~/.aws/credentials"
}
provider "aws" {
 region = "${var.region}"
 shared_credentials_file = "${var.shared_cred_file}"
 profile = "default"
 version = "~> 2.0"
}
resource "aws_instance" "first-instance" {
 ami   = "ami-061eb2b23f9f8839c"
 instance_type = "t2.micro"
 key_name = "DevOps_Project"
 tags = {
  Name = "Terraform_server1"
 }
}