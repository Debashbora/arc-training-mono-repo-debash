region           = "us-east-1"
instance_type    = "t2.micro"
subnet_id        = "subnet-6781cb49"
vpc_id           = "vpc-68f96212"
ssh_key          = "poc_ec2_arc"
assign_public_ip = false
volume_size = 30
volume_type = "gp3"
encrypted = true
delete_on_termination = true
