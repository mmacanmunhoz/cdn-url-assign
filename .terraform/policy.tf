### ORIGIN IDENTITY

resource "aws_s3_bucket_policy" "this" {
  bucket = module.s3.s3_bucket_id

  policy = <<EOT
{
  "Version": "2008-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
        "Sid": "CloudFrontAllow",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${module.cdn.cloudfront_origin_access_identity_ids[0]}"
        },
        "Action": "s3:GetObject", 
        "Resource": "${module.s3.s3_bucket_arn}/*"
    }
  ]

}
EOT
}