locals {
  # Name restrictions https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html#RDS_Limits.Constraints
  default_name = trimsuffix(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63), "-")
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.3.0"

  identifier = coalesce(var.name, local.default_name)
  db_name    = var.database_name
  port       = var.port

  engine               = var.engine
  engine_version       = var.engine_version
  family               = var.group_family
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  manage_master_user_password = false
  username                    = var.username
  password                    = var.password

  multi_az = var.multi_az

  create_db_subnet_group = var.create_db_subnet_group
  db_subnet_group_name   = coalesce(var.db_subnet_group_name, local.default_name)
  subnet_ids             = var.subnet_ids

  vpc_security_group_ids = var.vpc_security_group_ids

  maintenance_window      = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period

  create_cloudwatch_log_group     = var.create_cloudwatch_log_group
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  create_monitoring_role                = var.create_monitoring_role
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_name                  = var.monitoring_role_name
  monitoring_role_use_name_prefix       = var.monitoring_role_use_name_prefix
  monitoring_role_description           = var.monitoring_role_description

  parameters = var.parameters
}
