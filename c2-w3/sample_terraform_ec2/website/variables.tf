# input
variable "region" { # to use this variable in the code, use "var.region"
  type        = string
  default     = "us-east-1"
  description = "region for aws resouces"
}

variable "server_name" {
  type        = string
  # if default is not provided, it will be prompted during terraform apply
  # terraform apply -var server_name=ExampleServer
  # or use terraform.tfvars file
  description = "name of the server running the website"
}