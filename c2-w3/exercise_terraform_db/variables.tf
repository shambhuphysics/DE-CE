variable "vpc_id" {
  type = string
  description = "The VPC ID"
}

variable "db_username" {
  type = string
  description = "The username for the database"
  default = "admin_user"
}

variable "db_password" {
  type = string
  description = "The password for the database"
}