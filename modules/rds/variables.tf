variable "region" {
  type    = string
  default = "us-east-1"
}
variable "allocated_storage" {
  type    = number
  default = 10
}
variable "db_identifier" {
  type    = string
  default = null
}
variable "db_name" {
  type    = string
  default = "poc_db"
}
variable "db_engine" {
  type    = string
  default = "mysql"
}
variable "db_engine_version" {
  type    = string
  default = "8.0"
}
variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "admin_username" {
  type    = string
  default = "root"
}
variable "parameter_group_name" {
  type    = string
  default = "default.mysql8.0"
}
variable "db_subnet_group_name" {
  type    = string
  default = null
}
variable "skip_final_snapshot" {
  type    = bool
  default = true
}