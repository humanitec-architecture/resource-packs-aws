locals {
  # Name restrictions https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheCluster.html
  default_name = trimsuffix(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 50), "-")
}

resource "random_password" "auth_token" {
  length  = 16
  special = false
}

resource "aws_elasticache_replication_group" "main" {
  automatic_failover_enabled = true
  replication_group_id       = coalesce(var.name, local.default_name)
  description                = coalesce(var.name, local.default_name)
  node_type                  = var.node_type
  num_cache_clusters         = var.num_cache_clusters
  parameter_group_name       = var.parameter_group_name # tflint-ignore: aws_elasticache_replication_group_default_parameter_group
  port                       = var.port
  subnet_group_name          = var.subnet_group_name
  security_group_ids         = var.security_group_ids

  transit_encryption_enabled = true
  auth_token                 = random_password.auth_token.result
}
