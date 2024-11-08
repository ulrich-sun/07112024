variable "name" {
  type = string
}

variable "number" {
  type = number
}
variable "instance_name_master" {
  type = string 
  default = "Master"
}
variable "instance_name_worker" {
  type = string 
  default = "Worker"
}
variable "user" {
}
# variable "number" {
#   type = number
# }
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
# variable "security_groups" {
#   type = string
# }

variable "ingress_rules" {
    type = list(number)
    default = [80, 443, 8080, 22, 30010-30015, 8081]
  }

  variable "security_groups" {
    type = string
  }

variable "az" {
  type = string
}

variable "volume_size" {
  type = number
}
