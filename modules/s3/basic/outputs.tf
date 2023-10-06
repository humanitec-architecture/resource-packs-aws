output "bucket" {
  value = aws_s3_bucket.main.id
}

output "arn" {
  value = aws_s3_bucket.main.arn
}

output "region" {
  value = aws_s3_bucket.main.region
}
