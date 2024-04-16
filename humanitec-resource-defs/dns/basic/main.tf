resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}route53"
  name        = "${var.prefix}route53"
  type        = "dns"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/dns/basic"
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
        region         = var.region
        res_id         = "$${context.res.id}"
        app_id         = "$${context.app.id}"
        env_id         = "$${context.env.id}"
        hosted_zone_id = var.hosted_zone_id
        subdomain      = "$${context.app.id}-$${context.env.id}"
      }
    })
  }
}
