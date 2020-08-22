output "manager_address" {
  value = aws_instance.manager.public_ip
}

output "worker_address" {
  value = aws_instance.workers.*.public_ip
}