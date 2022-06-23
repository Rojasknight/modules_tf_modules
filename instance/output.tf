output "instance_ip" {
  value = aws_instance.plazi-instance.*.public_ip
}