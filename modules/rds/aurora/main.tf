module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "9.0.0"

  name          = var.name
  database_name = var.database_name

  engine         = var.engine
  engine_version = var.engine_version

  manage_master_user_password = false
  master_username             = var.master_username
  master_password             = var.master_password

  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted

  instances = var.instances

  endpoints = var.endpoints

  vpc_id  = var.vpc
  subnets = var.subnets

  create_db_subnet_group = var.create_db_subnet_group
  db_subnet_group_name   = var.db_subnet_group_name
  security_group_rules   = var.security_group_rules

  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot

  create_db_cluster_parameter_group      = true
  db_cluster_parameter_group_name        = var.name
  db_cluster_parameter_group_family      = var.group_family
  db_cluster_parameter_group_description = "${var.name} cluster parameter group"
  db_cluster_parameter_group_parameters  = var.db_cluster_parameter_group_parameters

  create_db_parameter_group      = true
  db_parameter_group_name        = var.name
  db_parameter_group_family      = var.group_family
  db_parameter_group_description = "${var.name} database parameter group"
  db_parameter_group_parameters  = var.db_parameter_group_parameters

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  create_cloudwatch_log_group     = var.create_cloudwatch_log_group

  create_db_cluster_activity_stream     = var.create_db_cluster_activity_stream
  db_cluster_activity_stream_kms_key_id = var.db_cluster_activity_stream_kms_key_id == null ? module.kms[0].key_id : var.db_cluster_activity_stream_kms_key_id
  db_cluster_activity_stream_mode       = var.db_cluster_activity_stream_mode
}

module "kms" {
  count = var.db_cluster_activity_stream_kms_key_id == null ? 1 : 0

  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.1"

  deletion_window_in_days = 7
  description             = "KMS key for ${var.name} cluster activity stream."
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
}
