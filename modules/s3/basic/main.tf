locals {
  # Name restrictions https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  default_name = trimsuffix(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63), "-")
}

resource "aws_s3_bucket" "main" {
  bucket        = coalesce(var.name, local.default_name)
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}
