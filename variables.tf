locals {
  settings = {
    default = {
      cdn_subdomain  = "www"
      cdn_cnames     = "*"
      description    = "Cloudfront distribution for capnduck.com"
      domain_name    = "capnduck.com"
      error_document = "error.html"
      index_document = "index.html"
      name           = "capnduck.com"
      owner          = "capnduck"
      private_zone   = "false"
      s3_bucket_acl  = "private"
      s3_bucket      = "capnduck.com"
      s3_origin_id   = "${terraform.workspace}-s3-origin"
    }

    prod = {
    }

    stage = {
    }

    qa = {
    }

    dev = {
    }
  }

  setting = merge(
    local.settings["default"], local.settings[terraform.workspace]
  )
}
