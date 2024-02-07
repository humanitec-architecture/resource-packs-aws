resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}sqs-basic"
  name        = "${var.prefix}sqs-basic"
  type        = "sqs"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/sqs/basic"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region = var.region,
        # TODO: How to template the queue name?
        # Name restrictions https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-queues.html
        # prefix = "${var.prefix}$${context.res.id}"
        prefix = "${var.prefix}basic-queue"

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
      }
    })
  }
}
