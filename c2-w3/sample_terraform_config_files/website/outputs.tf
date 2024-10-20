# output
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# terraform output to show all
# terraform output server_id to show only server_id
output "server_id" {
  value = aws_instance.webserver.id
}

output "server_arn" {
  value = aws_instance.webserver.arn
}