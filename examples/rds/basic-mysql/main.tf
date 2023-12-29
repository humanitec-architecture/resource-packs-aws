resource "humanitec_application" "app" {
  id   = var.name
  name = var.name
}

module "rds" {
  source = "../../../humanitec-resource-defs/rds/basic"

  prefix                 = "${var.name}-"
  resource_packs_aws_rev = var.resource_packs_aws_rev
  resource_packs_aws_url = var.resource_packs_aws_url

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  name          = "${var.name}-database"
  database_name = "my_database"
  username      = "username"
  password      = "password"

  type                 = "mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  group_family         = "mysql8.0"
  major_engine_version = "8.0"

  create_db_subnet_group = true
  db_subnet_group_name   = "${var.name}-subnet-group"
  subnet_ids             = var.subnet_ids

  vpc_security_group_ids = [aws_security_group.mysql.id]
}

resource "humanitec_resource_definition_criteria" "rds" {
  resource_definition_id = module.rds.id
  app_id                 = humanitec_application.app.id
}

resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "mysql"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "k8s_node_mysql" {
  security_group_id = aws_security_group.mysql.id

  referenced_security_group_id = var.k8s_node_security_group_id
  from_port                    = 5432
  ip_protocol                  = "tcp"
  to_port                      = 5432
}
