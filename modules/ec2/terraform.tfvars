region                      = "us-east-1"
instance_type               = "t2.micro"
instance_ami                = "ami-0bb84b8ffd87024d8"
subnet_id                   = "subnet-6781cb49"
vpc_id                      = "vpc-68f96212"
key_name                    = "poc_ec2_arc"
associate_public_ip_address = false
volume_size                 = 30
volume_type                 = "gp3"
encrypted                   = true
delete_on_termination       = true
ingress_rules = {
  ssh = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  http = {
    from_port   = 80
    to_port     = 80
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
