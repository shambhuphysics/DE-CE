/*
  You are given the ID of a VPC created in the us-east-1 region.
  You will need to create a MySQL RDS database instance inside a subnet of the given VPC.
  The VPC contains two private subnets;
  the IDs of these subnets are not given to you.
*/


data "aws_subnets" "subnet_ids" {
  filter {
    name = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = data.aws_subnets.subnet_ids.ids
}

resource "aws_db_instance" "my_database" {
  username             = var.db_username
  password             = var.db_password
  engine               = "mysql"
  allocated_storage    = 10
  db_name              = "mydb"
  port                 = 3306
  instance_class       = "db.t3.micro"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}