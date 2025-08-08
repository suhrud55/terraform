terraform {
  backend "s3" {
    bucket = "stevejack"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
    dynamodb_table = "test"
    encrypt = true
  }
}