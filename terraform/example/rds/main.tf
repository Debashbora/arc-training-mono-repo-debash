module "rds" {
  source            = "../../../modules/rds"
  region            = var.region
  db_name           = var.db_name
  db_identifier     = var.db_identifier
  subnet_ids        = data.aws_subnets.poc_arc_subnets.ids
  vpc_id            = data.aws_vpc.poc_vpc.id
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  #   db_storage_type             = var.db_storage_type
  admin_username = var.db_username
  #   set_secret_manager_password = var.set_secret_manager_password
  #   set_db_password             = var.set_db_password
  #   password                    = var.db_password
  db_instance_class = var.db_instance_class
  allocated_storage = var.db_storage_size
  ingress_rules     = var.ingress_rules
  egress_rules      = var.egress_rules
  #   backup_retention_period     = var.backup_retention_period
  multi_az = var.multi_az
  #   delete_automated_backups    = var.delete_automated_backups
  #   publicly_accessible         = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  #   apply_immediately           = var.apply_immediately
  #   environment                 = var.environment
  #   namespace                   = var.namespace
}