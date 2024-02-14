resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}redis-basic"
  name        = "${var.prefix}redis-basic"
  type        = "redis"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/redis/basic"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region = var.region
        prefix = var.prefix
        name   = var.name

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        node_type            = var.node_type
        parameter_group_name = var.parameter_group_name
        num_cache_clusters   = var.num_cache_clusters
        subnet_group_name    = var.subnet_group_name
        security_group_ids   = var.security_group_ids
      }
    })
  }
}
