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
data "aws_ami" "arc_poc_latest_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
