resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}iam-policy-ecr-create-repository"
  name        = "${var.prefix}iam-policy-ecr-create-repository"
  type        = "aws-policy"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/iam-policy/ecr-create-repository"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      append_logs_to_error = var.append_logs_to_error

      credentials_config = {
        environment = {
          AWS_ACCESS_KEY_ID     = "AccessKeyId"
          AWS_SECRET_ACCESS_KEY = "SecretAccessKey"
          AWS_SESSION_TOKEN     = "SessionToken"
        }
      }

      variables = {
        region = var.region,
        prefix = "${var.prefix}$${context.res.id}"

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
      }
    })
  }
}
