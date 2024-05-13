variable "region" {
  default = "us-east-1"
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
