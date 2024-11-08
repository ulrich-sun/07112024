resource "aws_eip" "name" {
  domain = true
  count = var.number
  tags = {
    Name = "eip-${var.name}"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip.txt"
  }
}

