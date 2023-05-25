terraform {
  backend "s3" {
    bucket         = "samsplayground-terraform-backend"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform.lock"
    encrypt        = true
  }
}
