output "ebs_volume_id" {
  value = aws_ebs_volume.name.*.id
}