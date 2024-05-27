terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = var.region
}

resource "tls_private_key" "httpdkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = var.name
  public_key = tls_private_key.httpdkey.public_key_openssh
}

resource "aws_instance" "poc_arc_ec2" {
  ami                         = var.instance_ami.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.name
  associate_public_ip_address = var.associate_public_ip_address
  security_groups             = [aws_security_group.instance_sg.id]
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination
  }
  tags = var.tags
}
resource "aws_security_group" "instance_sg" {
  name        = var.security_group_name
  description = "Security group for EC2 instance"

  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
