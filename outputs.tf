output "Jenkins_Master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "Jenkins_Worker_public_ip" {
  value = aws_instance.jenkins_worker.public_ip
}