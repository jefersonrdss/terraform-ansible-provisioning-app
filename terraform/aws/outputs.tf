# output "dev" {
#   value = aws_instance.dev1.public_ip
# }

output "node-app-ip" {
  value = aws_instance.node-app.public_ip
}