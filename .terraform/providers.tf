### PROVIDERS

variable "workspace_iam_roles" {
  default = {
    production  = "",
    homolog     = ""
  }
}

provider "aws" {
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }

  region                  = ""
  shared_credentials_file = "~/.aws/credentials"
  profile                 = ""
}