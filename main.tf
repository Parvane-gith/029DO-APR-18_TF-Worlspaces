terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "TerraformCloud_ziyotek"
    workspaces {
        prefix = "network-"
    }
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}
 
provider "aws" {}

module "iam" {
  source = "./modules/iam"
   read_only = {
    default = ["read_only_user_1", "read_only_user_2", "read_only_user_3"]
   }
}
 