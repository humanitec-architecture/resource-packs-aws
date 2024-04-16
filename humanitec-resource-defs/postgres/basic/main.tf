resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}rds"
  name        = "${var.prefix}rds"
  type        = var.type

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/rds/basic"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      append_logs_to_error = var.append_logs_to_error

      credentials_config = {
        environment = {
          AWS_ACCESS_KEY_ID     = "AccessKeyId"
          AWS_SECRET_ACCESS_KEY = "SecretAccessKey"
          AWS_SESSION_TOKEN     = "SessionToken"
        }
      }

      variables = {
        region = var.region
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        prefix                                = var.prefix
        name                                  = var.name
        database_name                         = var.database_name
        username                              = var.username
        password                              = var.password
        create_db_subnet_group                = var.create_db_subnet_group
        db_subnet_group_name                  = var.db_subnet_group_name
        subnet_ids                            = var.subnet_ids
        vpc_security_group_ids                = var.vpc_security_group_ids
        port                                  = var.port
        engine                                = var.engine
        engine_version                        = var.engine_version
        major_engine_version                  = var.major_engine_version
        group_family                          = var.group_family
        instance_class                        = var.instance_class
        allocated_storage                     = var.allocated_storage
        max_allocated_storage                 = var.max_allocated_storage
        multi_az                              = var.multi_az
        maintenance_window                    = var.maintenance_window
        backup_window                         = var.backup_window
        backup_retention_period               = var.backup_retention_period
        create_cloudwatch_log_group           = var.create_cloudwatch_log_group
        enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
        skip_final_snapshot                   = var.skip_final_snapshot
        deletion_protection                   = var.deletion_protection
        performance_insights_enabled          = var.performance_insights_enabled
        performance_insights_retention_period = var.performance_insights_retention_period
        create_monitoring_role                = var.create_monitoring_role
        monitoring_interval                   = var.monitoring_interval
        monitoring_role_name                  = var.monitoring_role_name
        monitoring_role_use_name_prefix       = var.monitoring_role_use_name_prefix
        monitoring_role_description           = var.monitoring_role_description
        parameters                            = var.parameters
      }
    })
  }
}
