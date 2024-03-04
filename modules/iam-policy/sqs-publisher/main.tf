data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "sqs:SendMessage",
    ]

    resources = [
      var.sqs_queue_arn,
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}sqs-publisher"
  description = "Allows publishing to SQS queue"
  policy      = data.aws_iam_policy_document.main.json
}
