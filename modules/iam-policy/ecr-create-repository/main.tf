data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "ecr:CreateRepository",
    ]

    resources = [
      "*",
    ]
  }
}


resource "aws_iam_policy" "main" {
  name        = "${var.prefix}ecr-create-repository"
  description = "Create ECR repository"
  policy      = data.aws_iam_policy_document.main.json
}
