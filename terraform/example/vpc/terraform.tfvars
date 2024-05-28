vpc_cidr_block             = "10.0.0.0/16"
public_subnet_cidr_blocks  = ["10.0.0.0/18", "10.0.64.0/18"]
private_subnet_cidr_blocks = ["10.0.128.0/18", "10.0.192.0/18"]
availability_zones         = ["us-east-1a", "us-east-1b"]
vpc_name                   = "arc-poc-vpc"
vpc_tags                   = { "Name" = "arc-poc-vpc" }
