resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${local.setting["cdn_subdomain"]}.${local.setting["domain_name"]}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www.domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = true
  }
}
