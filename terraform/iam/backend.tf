terraform {
  backend "s3" {
    bucket = "rafael-terraform-states"
    key    = "iam/terraform.tfstate"
    region = "us-east-1"
  }
}
