variable "region" {
  default = "us-east-1"
  type    = string
}
variable "cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}
variable "public_cidrs" {
  default = ["10.0.0.0/18", "10.0.64.0/18"]
  type    = list(string)
}
variable "private_cidrs" {
  default = ["10.0.128.0/18", "10.0.192.0/18"]
  type    = list(string)
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
  type    = list(string)
}
variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "Name for the VPC"
}
