data "aws_vpc" "poc_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

data "aws_subnet" "poc_arc_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}_subnet_public1"]
  }
}