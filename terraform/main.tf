provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "k3s_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.medium"
  key_name      = "k3s-key"

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y curl
              curl -sfL https://get.k3s.io | sh -
              EOF

  tags = {
    Name = "k3s-server-amazon-linux"
  }
}
