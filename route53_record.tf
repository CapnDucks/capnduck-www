resource "aws_route53_record" "apex" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = local.setting["domain_name"]
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www.domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_domain_name" {
  type    = "CNAME"
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${local.setting["cdn_subdomain"]}.${local.setting["domain_name"]}"
  records = [local.setting["domain_name"]]
  ttl     = "30"
}
