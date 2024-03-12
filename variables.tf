locals {
  settings = {
    default = {
      error_document = "error.html"
      index_document = "index.html"
      name           = "capnduck.com"
      owner          = "capnduck"
      s3_bucket_acl  = "private"
      s3_bucket      = "capnduck.com"
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
