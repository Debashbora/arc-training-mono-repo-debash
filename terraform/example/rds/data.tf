data "aws_vpc" "poc_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

data "aws_subnets" "poc_arc_subnets" {
  filter {
    name = "tag:Name"
    values = [
      "${var.environment}_subnet_private1",
      "${var.environment}_subnet_private2",
    ]
  }
}
