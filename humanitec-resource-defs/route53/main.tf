resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}route53"
  name        = "${var.prefix}route53"
  type        = "route"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/route53"
        rev  = var.resource_packs_aws_rev
        url  = "https://github.com/humanitec-architecture/resource-packs-aws.git"
      }

      variables = {
        region   = var.region
        res_id   = "$${context.res.id}"
        dns_zone = var.dns_zone
        dns_name = var.dns_name
        dns_type = var.dns_type
        dns_ttl  = var.dns_ttl
      }
    })
  }
}
