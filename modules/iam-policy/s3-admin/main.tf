data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      var.s3_bucket_arn,
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}s3-admin"
  description = "Allows full access to S3 buckets"
  policy      = data.aws_iam_policy_document.main.json
}
