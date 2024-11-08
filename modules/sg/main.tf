resource "aws_security_group" "name" {
  name = var.security_groups

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
  