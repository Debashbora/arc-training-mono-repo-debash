module "ec2_instance" {
  source = "../../../modules/ec2"

  name                        = var.name
  vpc_id                      = data.aws_vpc.poc_vpc.id
  subnet_id                   = data.aws_subnet.poc_arc_subnet.id
  key_name                    = var.key_name
  instance_ami                = var.instance_ami
  ingress_rules               = var.ingress_rules
  egress_rules                = var.egress_rules
  volume_type                 = var.root_volume_type
  volume_size                 = var.root_volume_size
  security_group_name         = "${var.name}-security-group"
  associate_public_ip_address = var.associate_public_ip

  tags = var.tags
}