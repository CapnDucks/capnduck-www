locals {
  domain_name = "capnduck.com"

  tags = {
    Owner     = "capnduck"
    terraform = "true"
  }
}

module "cdn" {
  source = "../modules/cloudfront"

  ordered_cache_behavior = []

  origin = {
    s3 = {
      domain_name = aws_s3_bucket_website_configuration.www.website_endpoint
    }
  }

  viewer_certificate = {
    acm_certificate_arn      = data.aws_acm_certificate.www.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  default_cache_behavior = {
    target_origin_id       = "s3"
    viewer_protocol_policy = "allow-all"
  }

  tags = local.tags
}
