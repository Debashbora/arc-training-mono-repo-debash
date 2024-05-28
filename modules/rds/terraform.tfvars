region               = "us-east-1"
allocated_storage    = 50
db_identifier        = "poc-arc-debash"
db_name              = "poc_db"
db_engine            = "mysql"
db_engine_version    = "8.0"
db_instance_class    = "db.t3.micro"
vpc_id               = "vpc-68f96212"
admin_username       = "root"
parameter_group_name = "default.mysql8.0"
subnet_ids           = ["subnet-0d980af52c1537b18", "subnet-0d7dce5a01bc9e1c6"]
db_subnet_group_name = "poc_arc_subnet_group"
db_port              = 3306
skip_final_snapshot  = true
ingress_rules = {
  db_port = {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

egress_rules = {
  all_traffic = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
multi_az = true
