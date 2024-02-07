resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}route53"
  name        = "${var.prefix}route53"
  type        = "dns"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/route53/basic"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region                       = var.region
        res_id                       = "$${context.res.id}"
        app_id                       = "$${context.app.id}"
        env_id                       = "$${context.env.id}"
        hosted_zone_id               = var.hosted_zone_id
        subdomain                    = var.subdomain
        alias_name                   = var.alias_name
        alias_zone_id                = var.alias_zone_id
        alias_evaluate_target_health = var.alias_evaluate_target_health
      }
    })
  }
}
