resource "humanitec_application" "app" {
  id   = var.name
  name = var.name
}

module "postgres" {
  source = "../../../humanitec-resource-defs/postgres/basic"

  resource_packs_aws_rev = var.resource_packs_aws_rev
  resource_packs_aws_url = var.resource_packs_aws_url

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  prefix        = var.prefix
  name          = var.name
  database_name = "my_database"
  username      = "username"
  password      = "password"

  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  vpc_security_group_ids = [aws_security_group.postgres.id]
}

resource "humanitec_resource_definition_criteria" "postgres" {
  resource_definition_id = module.postgres.id
  app_id                 = humanitec_application.app.id
}

resource "aws_security_group" "postgres" {
  name        = "postgres"
  description = "postgres"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "k8s_node_postgres" {
  security_group_id = aws_security_group.postgres.id

  referenced_security_group_id = var.k8s_node_security_group_id
  from_port                    = 5432
  ip_protocol                  = "tcp"
  to_port                      = 5432
}
