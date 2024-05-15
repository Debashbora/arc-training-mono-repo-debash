region               = "us-east-1"
allocated_storage    = 50
db_identifier        = "poc-arc-debash"
db_name              = "poc_db"
db_engine            = "mysql"
db_engine_version    = "8.0"
db_instance_class    = "db.t3.micro"
admin_username       = "root"
parameter_group_name = "default.mysql8.0"
db_subnet_group_name = "default"
skip_final_snapshot  = true

