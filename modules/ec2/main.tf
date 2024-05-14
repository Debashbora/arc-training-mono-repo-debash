terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #   backend "s3" {}
}

provider "aws" {
  region = var.region
}
data "aws_ami" "amazon-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}
resource "tls_private_key" "ssh_key_generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ssh_key
  public_key = tls_private_key.ssh_key_generate.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_generate.private_key_pem}' > ../../${var.ssh_key}.pem"
  }
}

resource "aws_instance" "poc_arc_ec2" {
  ami                         = data.aws_ami.amazon-ami.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = var.assign_public_ip
  security_groups = [aws_security_group.instance_sg.id]
    root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination
  }
 tags = {
    Name = "poc_arc_ec2"
  }
}
resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Security group for EC2 instance"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
