terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.60.0"
    }
  }
}
variable "elb_names" {
    type = list
    default = ["dev-loadbalancer","stage-loadbalancer","prod-loadbalancer"]
  }
resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  path = "/system/"
  count = 3
}