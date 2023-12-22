resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}rds-aurora"
  name        = "${var.prefix}rds-aurora"
  type        = var.type

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/rds/aurora"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region = var.region
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        name                                  = var.name
        database_name                         = var.database_name
        master_username                       = var.master_username
        master_password                       = var.master_password
        vpc                                   = var.vpc
        subnets                               = var.subnets
        db_subnet_group_name                  = var.db_subnet_group_name
        create_db_subnet_group                = var.create_db_subnet_group
        engine                                = var.engine
        engine_version                        = var.engine_version
        group_family                          = var.group_family
        storage_type                          = var.storage_type
        storage_encrypted                     = var.storage_encrypted
        instances                             = var.instances
        endpoints                             = var.endpoints
        security_group_rules                  = var.security_group_rules
        apply_immediately                     = var.apply_immediately
        skip_final_snapshot                   = var.skip_final_snapshot
        db_cluster_parameter_group_parameters = var.db_cluster_parameter_group_parameters
        db_parameter_group_parameters         = var.db_parameter_group_parameters
        enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
        create_cloudwatch_log_group           = var.create_cloudwatch_log_group
        create_db_cluster_activity_stream     = var.create_db_cluster_activity_stream
        db_cluster_activity_stream_kms_key_id = var.db_cluster_activity_stream_kms_key_id
        db_cluster_activity_stream_mode       = var.db_cluster_activity_stream_mode
      }
    })
  }
}
