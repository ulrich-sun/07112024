resource "aws_ebs_volume" "name" {
  availability_zone = var.az
  size      = var.volume_size
  count = var.number
}

