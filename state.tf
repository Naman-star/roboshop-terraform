terraform {
  backend "s3" {
    bucket = "terraform-nb72"
    key = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}