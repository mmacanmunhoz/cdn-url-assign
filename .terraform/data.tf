#### INFRA STATE

data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    profile                 = ""
    shared_credentials_file = ""

    bucket = ""
    key    = ""
    region = ""
  }
}




