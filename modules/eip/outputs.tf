output "eip_master_id" {
  value = aws_eip.master.*.id
}

output "eip_worker_id" {
  value = aws_eip.worker.*.id
}