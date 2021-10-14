# output "dev" {
#   value = aws_instance.dev1.public_ip
# }

output "ip-node-app" {
  value = aws_instance.node-app.public_ip
}