terraform {
  backend "s3" {
    profile                 = ""
    shared_credentials_file = "~/.aws/credentials"
    dynamodb_table          = ""

    bucket = ""
    key    = ""
    region = ""
  }
}