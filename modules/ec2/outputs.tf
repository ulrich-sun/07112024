output "ec2_instance_master_id" {
  value = aws_instance.ec2_instance_master.*.id
}

output "ec2_instance_worker_id" {
  value = aws_instance.ec2_instance_worker.*.id
}