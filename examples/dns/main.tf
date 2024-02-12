resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "route53" {
  source = "../../humanitec-resource-defs/dns/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  region                 = var.region

  prefix = var.prefix

  hosted_zone_id = var.hosted_zone_id
}

resource "humanitec_resource_definition_criteria" "dns" {
  resource_definition_id = module.route53.id
  app_id                 = humanitec_application.example.id
}
