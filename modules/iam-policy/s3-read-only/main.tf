data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      var.s3_bucket_arn,
    ]
  }

  statement {
    actions = [
      "s3:Get*",
    ]

    resources = [
      "${var.s3_bucket_arn}/*"
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}s3-read-only"
  description = "Allows read-only access to S3 buckets"
  policy      = data.aws_iam_policy_document.main.json
}
