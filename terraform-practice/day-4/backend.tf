terraform {
  backend "s3" {
    bucket = "showtiemmmm"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
    dynamodb_table = "value"
    encrypt = true
  }
}
