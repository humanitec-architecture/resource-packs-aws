# Prepare application, subnet group and security group

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "redis" {
  name        = "redis"
  description = "redis"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "k8s_node_redis" {
  security_group_id = aws_security_group.redis.id

  referenced_security_group_id = var.k8s_node_security_group_id
  from_port                    = 6379
  ip_protocol                  = "tcp"
  to_port                      = 6379
}

# AWS Elasticache Redis

module "redis" {
  source = "../../humanitec-resource-defs/redis/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  region                 = var.region

  prefix             = var.prefix
  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]
}

resource "humanitec_resource_definition_criteria" "redis" {
  resource_definition_id = module.redis.id
  app_id                 = humanitec_application.example.id
}
