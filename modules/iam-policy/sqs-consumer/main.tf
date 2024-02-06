data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "sqs:ReceiveMessage",
    ]

    resources = [
      var.sqs_queue_arn,
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}sqs-consumer"
  description = "Allows consuming from SQS queue"
  policy      = data.aws_iam_policy_document.main.json
}
