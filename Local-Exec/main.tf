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
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }


}