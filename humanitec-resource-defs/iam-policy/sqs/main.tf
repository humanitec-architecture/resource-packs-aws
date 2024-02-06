resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}iam-policy-sqs-${var.policy}"
  name        = "${var.prefix}iam-policy-sqs-${var.policy}"
  type        = "aws-policy"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/iam-policy/sqs-${var.policy}"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region = var.region,
        prefix = "${var.prefix}$${context.res.id}"

        res_id        = "$${context.res.id}"
        app_id        = "$${context.app.id}"
        env_id        = "$${context.env.id}"
        sqs_queue_arn = "$${resources['sqs.${var.sqs_resource_class}'].outputs.arn}"
      }
    })
  }
}
