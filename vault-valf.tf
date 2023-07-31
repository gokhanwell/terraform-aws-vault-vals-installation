terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "Terraform-Vault-Vals-Server" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Terraform-Vault-Vals-Sec-Gr.id]
  user_data              = filebase64("${path.module}/install-vault-vals.sh")
  tags = {
    Name = var.tags
  }
}

resource "aws_security_group" "Terraform-Vault-Vals-Sec-Gr" {
  name = var.secgrname
  tags = {
    Name = var.secgrname
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8200
    protocol    = "tcp"
    to_port     = 8200
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "vault-vals" {
  value = "https://${aws_instance.Terraform-Vault-Vals-Server.public_ip}:8200"
}
