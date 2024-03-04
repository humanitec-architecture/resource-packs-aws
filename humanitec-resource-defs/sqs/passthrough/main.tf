resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/template"
  id          = "${var.prefix}sqs-${var.sqs_resource_class}-${var.policy_resource_class}"
  name        = "${var.prefix}sqs-${var.sqs_resource_class}-${var.policy_resource_class}"
  type        = "sqs"

  driver_inputs = {
    values_string = jsonencode({
      templates = {
        outputs = <<EOL
arn: "$${resources['sqs.${var.sqs_resource_class}'].outputs.arn}"
region: "$${resources['sqs.${var.sqs_resource_class}'].outputs.region}"
url: "$${resources['sqs.${var.sqs_resource_class}'].outputs.url}"
EOL
      }
    })
  }

  provision = {
    "aws-policy.${var.policy_resource_class}" = {
      match_dependents = true
      is_dependent     = false
    }
  }
}
