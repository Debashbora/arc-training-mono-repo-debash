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
variable "vpc_id" {
  type    = string
  default = null
}
variable "ingress_rules" {
  description = "A map of ingress rules"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    db_port = {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}

variable "egress_rules" {
  description = "A map of egress rules"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    all_traffic = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}
variable "multi_az" {
  default = true
  type    = bool
}
variable "db_port" {
  type    = number
  default = 3306
}
variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
}
variable "password" {
  default = null
}