terraform {
  backend "s3" {
    bucket = "showtiem"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
    dynamodb_table = "value"
    encrypt = true
  }
}
