# S3 Bucket
resource "aws_s3_bucket" "static" {
  bucket = "my-static-bucket"
  acl    = "public-read"

  tags = {
    Name = "static-bucket"
  }
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_s3_bucket.static.bucket_regional_domain_name
    origin_id   = "s3-my-static-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "My CloudFront distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "s3-my-static-bucket"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = "my-cloudfront-cdn"
  }
}

# CloudFront Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "OAI for my S3 bucket"
}
