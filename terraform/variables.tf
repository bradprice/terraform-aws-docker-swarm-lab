variable "region" {
  default = "us-east-1"
}

variable "host_type" {
  default = "t2.micro"
}

variable "host_ami" {
  default = "ami-08f3d892de259504d"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "instance_count" {
  default = "1"
}

variable "manager_ip" {
  default = "172.16.25.100"
}

variable "node_ips" {
  default = {
    "0" = "172.16.25.101"
    "1" = "172.16.25.102"
  }
}
