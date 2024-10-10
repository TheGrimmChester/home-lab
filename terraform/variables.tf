variable "cluster_name" {
  type    = string
  default = "home-lab"
}

variable "default_gateway" {
  type    = string
  default = "192.168.1.254"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "192.168.1.29"
}
