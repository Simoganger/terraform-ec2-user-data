terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "template_file" "install_script" {
  template = file("${path.module}/install.sh")
}

resource "aws_instance" "bastion_server" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  user_data     = data.template_file.install_script.rendered
}

output "instance_ip" {
  value = aws_instance.bastion_server.public_ip
}