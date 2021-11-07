terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.60.0"
    }
  }
}
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-01cc34ab2709337aa"
    "us-west-2" = "ami-0e5b6b6a9f3db6db8"
    "ap-south-1" = "ami-041db4a969fe3eb68"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/vishnu.txt")
}

resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}