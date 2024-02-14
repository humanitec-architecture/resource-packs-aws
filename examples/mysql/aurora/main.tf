resource "humanitec_application" "app" {
  id   = var.name
  name = var.name
}

module "mysql" {
  source = "../../../humanitec-resource-defs/mysql/aurora"

  resource_packs_aws_rev = var.resource_packs_aws_rev
  resource_packs_aws_url = var.resource_packs_aws_url

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  prefix          = var.prefix
  name            = var.name
  database_name   = "my_database"
  master_username = "username"
  master_password = "password"

  vpc                    = var.vpc_id
  subnets                = var.subnet_ids
  create_db_subnet_group = true
  security_group_rules = {
    ingress = {
      source_security_group_id = var.k8s_node_security_group_id
    }
  }
}

resource "humanitec_resource_definition_criteria" "mysql" {
  resource_definition_id = module.mysql.id
  app_id                 = humanitec_application.app.id
}
