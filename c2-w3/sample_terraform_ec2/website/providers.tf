# terraform settings
terraform {
  required_providers {
    aws = { # local name: https://developer.hashicorp.com/terraform/language/providers/requirements#local-names
      source  = "hashicorp/aws" # global identifier
      version = ">= 4.16"
    }
  }

  required_version = ">= 1.2.0" # version constraint for terraform
}

# provides
# https://registry.terraform.io/browse/providers
provider "aws" { # use local name
  region = var.region
}