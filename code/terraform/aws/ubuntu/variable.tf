// variable "ami" {
//   type = "map"

//   default = {
//     "ap-southeast-1" = "ami-061eb2b23f9f8839c"
//   }
// }

variable "instance_count" {
  default = "10"
}

variable "instance_tags" {
  type = "list"
  default = ["Terraform-1", "Terraform-2", "Terraform-3", "Terraform-4", "Terraform-5", "Terraform-6", "Terraform-7", "Terraform-8", "Terraform-9", "Terraform-10"]
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "shared_cred_file" {
 default = "~/.aws/credentials"
}

variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-061eb2b23f9f8839c"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key_name" {
    default = "DevOps_Project"
}

variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = "list"
  default = []
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}