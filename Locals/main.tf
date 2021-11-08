terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}

locals {
  common_tags = {
    owner   = "Devops Team"
    service = "backend"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-041db4a969fe3eb68"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-041db4a969fe3eb68"
  instance_type = "t2.small"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "ap-south-1a"
  size              = 8
  tags              = local.common_tags
}
