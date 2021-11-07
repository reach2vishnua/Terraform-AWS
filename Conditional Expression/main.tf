terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.60.0"
    }
  }
}

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-041db4a969fe3eb68"
   instance_type = "t2.micro"
   count = var.istest == true ? 1 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-041db4a969fe3eb68"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}