terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}
resource "aws_iam_user" "lb" {
  name = var.usernumber
  path = "/system/"
}
