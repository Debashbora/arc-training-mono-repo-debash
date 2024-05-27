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

resource "aws_db_instance" "poc_arc_db" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  identifier             = var.db_identifier
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  multi_az               = var.multi_az
  instance_class         = var.db_instance_class
  username               = var.admin_username
  password               = aws_ssm_parameter.admin_db_password.value
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  port                   = var.db_port
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

}
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Security group for rds "

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


resource "random_password" "admin_db_password" {
  length           = 16
  special          = true
  override_special = "_%"
}

resource "aws_ssm_parameter" "admin_db_password" {
  name  = "/poc_arc/${var.db_engine}/admin_db_password"
  type  = "SecureString"
  value = random_password.admin_db_password.result
}