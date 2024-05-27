environment         = "poc"
namespace           = "arc"
key_name            = "poc_instance_key"
root_volume_type    = "gp3"
root_volume_size    = 30
associate_public_ip = true
instance_ami = {
  id            = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
}

## sg_rules ####
name = "arc-poc"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
]
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },

]
tags = {
  Name        = "arc_poc_debash"
  Environment = "poc"

}
