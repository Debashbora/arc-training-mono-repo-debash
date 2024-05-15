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
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  identifier           = var.db_identifier
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.admin_username
  password             = aws_ssm_parameter.admin_db_password.value
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  db_subnet_group_name = var.db_subnet_group_name

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