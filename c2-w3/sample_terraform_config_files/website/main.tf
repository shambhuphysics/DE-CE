# data source
# In case you want to create an instance inside a subnet that is already created, you can use the following code:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
data "aws_subnet" "selected_subnet" {
  id = "subnet-0c55b159cbfafe1f0" # https://docs.aws.amazon.com/vpc/latest/userguide/vpc-subnets.html
  # ☝ access this by: data.aws_subnet.selected_subnet.id
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "name"
    values = ["a1202*-ami-202*"]
  }
}

# resouces
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "webserver" { # can be referenced as "aws_instance.webserver" in other parts of the code
  # ami = "ami-0c55b159cbfafe1f0" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected_subnet.id # Without this, the instance will be created in the default VPC.
  tags = {
    Name = var.server_name
  }
}