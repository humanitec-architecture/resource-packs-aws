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
      "sqs:*",
    ]

    resources = [
      var.sqs_queue_arn,
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}sqs-admin"
  description = "Allows full access to SQS queue"
  policy      = data.aws_iam_policy_document.main.json
}
