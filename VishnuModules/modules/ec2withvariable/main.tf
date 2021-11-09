resource "aws_instance" "myec2" {
  ami                    = "ami-041db4a969fe3eb68"
  instance_type          = var.instancetype
}