terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami           = "ami-041db4a969fe3eb68"
  instance_type = "t2.micro"
  monitoring    = true
  subnet_id     = "subnet-082e5344"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}