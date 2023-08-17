# variable "region" {
  #type    = string
 # default = "us-west-2a"
#}


variable "ntier-vpc" {
  type    = string
  default = "192.168.0.0/16"
}


variable "ntier-subnet" {
  type    = string
  default = "192.168.0.0/24"
}

variable "public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
