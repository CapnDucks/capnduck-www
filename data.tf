data "aws_route53_zone" "this" {
  name = local.setting["domain_name"]
}

data "aws_acm_certificate" "www" {
  domain = local.setting["domain_name"]
  statuses = ["ISSUED"]
}

data "aws_caller_identity" "this" {}
