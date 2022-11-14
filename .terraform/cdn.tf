### CDN

module "cdn" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "2.9.2"

  aliases = "macan-testing.local"

  viewer_certificate = {
    cloudfront_default_certificate = false
    acm_certificate_arn            = ""
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  comment             = "Frontend CDN Distribution"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = true
  default_root_object = "index.html"
  web_acl_id          = ""

  create_origin_access_identity = true

  origin_access_identities = {
    access-identity-macan-testing = "access-identity-macan-testing"
  }

  origin = {
    macan-testing = {
      domain_name = module.s3.s3_bucket_bucket_domain_name

      s3_origin_config = {
        origin_access_identity = "access-identity-macan-testing"
      }
    }
  }


  default_cache_behavior = {
    target_origin_id       = "macan-testing"
    viewer_protocol_policy = "redirect-to-https"

    ### ADD REFERENCE KEY HERE
    
    trusted_key_groups  = [
          aws_cloudfront_key_group.this.id
    ]

    allowed_methods      = ["GET", "HEAD", "OPTIONS"]
    cached_methods       = ["GET", "HEAD"]
    compress             = true
    query_string         = true
    use_forwarded_values = true
    headers              = [""]

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

}


#### GENERATE KEY

resource "aws_cloudfront_key_group" "this" {
 comment = "Valid Document Signing Keys"
 items = [
   aws_cloudfront_public_key.this.id
 ]
 name = "matheus-keys"
}

resource "aws_cloudfront_public_key" "this" {
 name        = "matheus-local-key"
 comment     = "matheus-local-key"
 encoded_key = <<EOT
-----BEGIN PUBLIC KEY-----

-----END PUBLIC KEY-----
EOT
}
