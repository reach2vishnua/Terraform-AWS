terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.60.0"
    }
  }
}
resource "aws_instance" "myec2" {
  ami                    = "ami-041db4a969fe3eb68"
  instance_type          = "t2.micro"
  key_name               = "vishnu-terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./vishnu-terraform.pem")
      host        = self.public_ip
    }
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
