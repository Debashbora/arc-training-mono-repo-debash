variable "region" {
  type    = string
  default = "us-east-1"
}
variable "subnet_id" {
  type    = string
  default = "subnet-6781cb49"

}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "vpc_id" {
  type    = string
  default = "vpc-68f96212"
}
variable "ssh_key" {
  type    = string
  default = null
}
variable "assign_public_ip" {
  type    = bool
  default = false
}
variable "volume_type" {
  type = string
  default = "gp3"
}
variable "volume_size" {
  type        = number
  default     = 8   
}

variable "encrypted" {
  type        = bool
  default     = true   
}
variable "delete_on_termination" {
  type        = bool
  default     = true   
}