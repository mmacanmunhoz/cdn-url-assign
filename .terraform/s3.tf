### S3

module "s3" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "<=2.14.0"
  bucket        = "macan-testing.local"
  acl           = "private"
  force_destroy = true


  website = {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule = [
    {
      allowed_methods = ["GET"]
      allowed_origins = ["*"]
      allowed_headers = ["*"]
      expose_headers  = []
      max_age_seconds = 0
    }
  ]
}