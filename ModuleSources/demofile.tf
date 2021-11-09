terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}
module "demomodule" {
  source = "github.com/zealvora/tmp-repo"
}