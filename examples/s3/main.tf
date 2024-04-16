# AWS IAM role used by Humanitec to provision resources

locals {
  admin_policy_arn   = "arn:aws:iam::aws:policy/AdministratorAccess"
  humanitec_user_arn = "arn:aws:iam::767398028804:user/humanitec"
}

resource "random_password" "external_id" {
  length  = 16
  special = false
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [local.humanitec_user_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [random_password.external_id.result]
    }
  }
}

resource "aws_iam_role" "humanitec_provisioner" {
  name = var.name

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "humanitec_provisioner" {
  role       = aws_iam_role.humanitec_provisioner.name
  policy_arn = local.admin_policy_arn
}

resource "humanitec_resource_account" "humanitec_provisioner" {
  id   = var.name
  name = var.name
  type = "aws-role"
  credentials = jsonencode({
    aws_role    = aws_iam_role.humanitec_provisioner.arn
    external_id = random_password.external_id.result
  })

  depends_on = [
    # Otherwise the account looses permissions before the resources are deleted
    aws_iam_role_policy_attachment.humanitec_provisioner
  ]
}

# Example application and resource definition criteria

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

# S3 bucket

locals {
  # Classes used to build the resource definition graph
  s3_basic_class            = "basic"
  s3_admin_policy_class     = "s3-basic-admin"
  s3_read_only_policy_class = "s3-basic-read-only"

  # Classes that developers can select from
  s3_basic_admin_class     = "basic-admin"
  s3_basic_read_only_class = "basic-read-only"
}

# Define s3 bucket basic "flavour" as base

module "s3_basic" {
  source = "../../humanitec-resource-defs/s3/basic"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "s3_basic" {
  resource_definition_id = module.s3_basic.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_basic_class

  force_delete = true
}

# Add different access policy to s3 basic bucket

# Admin

## Policy
module "iam_policy_s3_admin" {
  source = "../../humanitec-resource-defs/iam-policy/s3"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  policy = "admin"

  prefix = var.prefix

  s3_resource_class = local.s3_basic_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_s3_admin" {
  resource_definition_id = module.iam_policy_s3_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_admin_policy_class

  force_delete = true
}

## Exposed delegator resource definition
module "s3_basic_admin" {
  source = "../../humanitec-resource-defs/s3/delegator"

  prefix = var.prefix

  s3_resource_class     = local.s3_basic_class
  policy_resource_class = local.s3_admin_policy_class
}

resource "humanitec_resource_definition_criteria" "s3_basic_admin" {
  resource_definition_id = module.s3_basic_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_basic_admin_class

  force_delete = true
}


# Read-only

## Policy
module "iam_policy_s3_read_only" {
  source = "../../humanitec-resource-defs/iam-policy/s3"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  policy = "read-only"

  prefix = var.prefix

  s3_resource_class = local.s3_basic_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_s3_read_only" {
  resource_definition_id = module.iam_policy_s3_read_only.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_read_only_policy_class

  force_delete = true
}

## Exposed delegator resource definition
module "s3_basic_read_only" {
  source = "../../humanitec-resource-defs/s3/delegator"

  prefix = var.prefix

  s3_resource_class     = local.s3_basic_class
  policy_resource_class = local.s3_read_only_policy_class
}

resource "humanitec_resource_definition_criteria" "s3_basic_read_only" {
  resource_definition_id = module.s3_basic_read_only.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_basic_read_only_class

  force_delete = true
}


# Required resources for workload identity

module "k8s_service_account" {
  source = "../../humanitec-resource-defs/k8s/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "k8s_service_account" {
  resource_definition_id = module.k8s_service_account.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "iam_role_service_account" {
  source = "../../humanitec-resource-defs/iam-role/service-account"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  cluster_name = var.cluster_name
  prefix       = var.prefix
}

resource "humanitec_resource_definition_criteria" "iam_role_service_account" {
  resource_definition_id = module.iam_role_service_account.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "workload" {
  source = "../../humanitec-resource-defs/workload/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = module.workload.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}
