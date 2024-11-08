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
variable "number" {
  type = number
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "security_groups" {
  type = string
}

variable "az" {
}