terraform {
  backend "s3" {
    bucket = "rafael-terraform-states"
    key    = "lambda/terraform.tfstate"
    region = "us-east-1"
  }
}
