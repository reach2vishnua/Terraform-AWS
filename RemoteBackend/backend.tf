terraform {
  backend "s3" {
    bucket = "vishnulabs-remote-backend"
    key    = "remote.tfstate"
    region = "ap-south-1"
    dynamodb_table = "s3-state-lock"
  }
}