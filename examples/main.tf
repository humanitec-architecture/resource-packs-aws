variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "humanitec_organization" {
  type = string
}

variable "resource_packs_aws_rev" {
  type    = string
  default = "refs/heads/main"
}

variable "oidc_provider" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "name" {
  type    = string
  default = "item-list"
}

locals {
  res_def_prefix = "${var.name}-"
}

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "k8s_service_account" {
  source = "../humanitec-resource-defs/k8s/service-account"

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "k8s_service_account" {
  resource_definition_id = module.k8s_service_account.id
  app_id                 = humanitec_application.example.id
}

# S3 bucket

locals {
  s3_class              = "default"
  s3_admin_policy_class = "s3-admin"
}

module "s3_basic" {
  source = "../humanitec-resource-defs/s3/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  humanitec_organization = var.humanitec_organization
  region                 = var.region
  policy_classes         = [local.s3_admin_policy_class]

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "s3_basic" {
  resource_definition_id = module.s3_basic.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_class
}

module "iam_policy_s3_admin" {
  source = "../humanitec-resource-defs/iam-policy/s3-admin"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  humanitec_organization = var.humanitec_organization
  region                 = var.region

  prefix                       = local.res_def_prefix
  s3_resource_definition_class = local.s3_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_s3_admin" {
  resource_definition_id = module.iam_policy_s3_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.s3_admin_policy_class
}

# SQS queue

locals {
  sqs_class              = "default"
  sqs_admin_policy_class = "sqs-admin"
}

module "sqs_basic" {
  source = "../humanitec-resource-defs/sqs/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  humanitec_organization = var.humanitec_organization
  region                 = var.region
  policy_classes         = [local.sqs_admin_policy_class]

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "sqs_basic" {
  resource_definition_id = module.sqs_basic.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_class
}

module "iam_policy_sqs_admin" {
  source = "../humanitec-resource-defs/iam-policy/sqs-admin"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  humanitec_organization = var.humanitec_organization
  region                 = var.region

  prefix                        = local.res_def_prefix
  sqs_resource_definition_class = local.sqs_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_sqs_admin" {
  resource_definition_id = module.iam_policy_sqs_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_admin_policy_class
}

module "iam_role_service_account" {
  source = "../humanitec-resource-defs/iam-role/service-account"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  humanitec_organization = var.humanitec_organization
  region                 = var.region

  oidc_provider     = var.oidc_provider
  oidc_provider_arn = var.oidc_provider_arn
  prefix            = local.res_def_prefix
  policy_classes    = []
}

resource "humanitec_resource_definition_criteria" "iam_role_service_account" {
  resource_definition_id = module.iam_role_service_account.id
  app_id                 = humanitec_application.example.id
}

module "workload" {
  source = "../humanitec-resource-defs/workload/service-account"

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = module.workload.id
  app_id                 = humanitec_application.example.id
}
