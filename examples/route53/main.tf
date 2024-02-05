locals {
  res_def_prefix = "${var.name}-"
}

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "route53" {
  source = "../../humanitec-resource-defs/route53/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  region                 = var.region

  prefix = local.res_def_prefix

  hosted_zone = var.hosted_zone
  subdomain   = "$${context.env.id}-${var.name}"

  ip_address = var.ip_address
}

resource "humanitec_resource_definition_criteria" "redis" {
  resource_definition_id = module.route53.id
  app_id                 = humanitec_application.example.id
}
