region            = "us-east-1"
multi_az          = false
db_name           = "poc_arc_debash"
db_engine         = "mysql"
db_engine_version = "8.0.35"
db_username       = "admin"
db_instance_class = "db.t3.micro"
db_storage_size   = 50
db_identifier     = "arc-poc-debash"

# Security Group Vars
ingress_rules = {
  "mysql_rule" = {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
egress_rules = {
  "mysql_rule" = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
skip_final_snapshot = true
environment         = "poc"
namespace           = "arc"