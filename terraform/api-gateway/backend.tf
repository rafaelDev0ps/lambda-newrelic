terraform {
  backend "s3" {
    bucket = "rafael-terraform-states"
    key    = "api-gateway/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
