resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${local.setting["cdn_subdomain"]}.${data.aws_route53_zone.this.name}"
  type    = "A"
  ttl     = "300"
  records = [module.cdn.cloudfront_distribution_domain_name]
}
