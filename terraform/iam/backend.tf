terraform {
  backend "s3" {
    bucket = "rafael-terraform-states"
    key    = "iam/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
