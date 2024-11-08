variable "ingress_rules" {
    type = list(number)
    default = [80, 443, 8080, 22, 30010-30015, 8081]
  }

  variable "security_groups" {
    type = string
  }