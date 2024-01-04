resource "humanitec_application" "app" {
  id   = var.name
  name = var.name
}

module "rds" {
  source = "../../../humanitec-resource-defs/rds/aurora"

  prefix                 = "${var.name}-"
  resource_packs_aws_rev = var.resource_packs_aws_rev
  resource_packs_aws_url = var.resource_packs_aws_url

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  name            = "${var.name}-database"
  database_name   = "my_database"
  master_username = "username"
  master_password = "password"

  vpc                    = var.vpc_id
  subnets                = var.subnet_ids
  db_subnet_group_name   = "${var.name}-subnet-group"
  create_db_subnet_group = true
  security_group_rules = {
    ingress = {
      type        = "ingress"
      from_port   = 0
      to_port     = 6555
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress = {
      type        = "egress"
      from_port   = 0
      to_port     = 6555
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "humanitec_resource_definition_criteria" "rds" {
  resource_definition_id = module.rds.id
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