resource "null_resource" "deploy_www" {
  provisioner "local-exec" {
    command     = "aws s3 sync html/ s3://${aws_s3_bucket.www.id}" 
  }

  depends_on = [
    aws_s3_bucket.www
  ]
}
