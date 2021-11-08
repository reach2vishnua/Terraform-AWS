terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-041db4a969fe3eb68"
  instance_type = var.types["ap-south-1"]
}