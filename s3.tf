resource "aws_s3_bucket" "www" {
  bucket = local.setting["s3_bucket"]

  tags = {
    Name = "Capnduck.com S3 Bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "www" {
  bucket = aws_s3_bucket.www.id

  index_document {
    suffix = local.setting["index_document"]
  }

  error_document {
    key = local.setting["error_document"]
  }
}

resource "aws_s3_bucket_public_access_block" "www" {
  bucket = aws_s3_bucket.www.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_policy" "www" {
  bucket = aws_s3_bucket.www.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          aws_s3_bucket.www.arn,
          "${aws_s3_bucket.www.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket_ownership_controls" "www" {
  bucket = aws_s3_bucket.www.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "www" {
  bucket = aws_s3_bucket.www.id
  acl    = local.setting["s3_bucket_acl"]

  depends_on = [aws_s3_bucket_ownership_controls.www]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "www" {
  bucket = aws_s3_bucket.www.bucket
  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "www" {
  bucket = aws_s3_bucket.www.id
  versioning_configuration {
    status = "Enabled"
  }
}
