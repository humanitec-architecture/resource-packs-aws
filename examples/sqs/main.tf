locals {
  res_def_prefix = "${var.name}-"
}

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

# SQS queue

locals {
  # Classes used to build the resource definition graph
  sqs_basic_class            = "basic"
  sqs_publisher_policy_class = "sqs-basic-publisher"
  sqs_consumer_policy_class  = "sqs-basic-consumer"

  # Classes that developers can select from
  sqs_basic_publisher_class = "basic-publisher"
  sqs_basic_consumer_class  = "basic-consumer"
}

# Define sqs queue basic "flavour" as base

module "sqs_basic" {
  source = "../../humanitec-resource-defs/sqs/basic"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  region                 = var.region

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "sqs_basic" {
  resource_definition_id = module.sqs_basic.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_class
}

# Add different access policy to sqs basic queue

# Publisher

## Policy

module "iam_policy_sqs_publisher" {
  source = "../../humanitec-resource-defs/iam-policy/sqs"

  access_key             = var.access_key
  secret_key             = var.secret_key
  resource_packs_aws_rev = var.resource_packs_aws_rev
  region                 = var.region

  prefix             = local.res_def_prefix
  policy             = "publisher"
  sqs_resource_class = local.sqs_basic_publisher_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_sqs_publisher" {
  resource_definition_id = module.iam_policy_sqs_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_publisher_policy_class
}

## Exposed passthrough resource definition
module "sqs_basic_publisher" {
  source = "../../humanitec-resource-defs/sqs/passthrough"

  prefix = local.res_def_prefix

  sqs_resource_class    = local.sqs_basic_class
  policy_resource_class = local.sqs_publisher_policy_class
}

resource "humanitec_resource_definition_criteria" "sqs_basic_publisher" {
  resource_definition_id = module.sqs_basic_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_publisher_class
}

# Consumer

## Policy
module "iam_policy_sqs_consumer" {
  source = "../../humanitec-resource-defs/iam-policy/sqs"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  policy = "read-only"

  prefix = local.res_def_prefix

  sqs_resource_class = local.sqs_basic_consumer_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_sqs_consumer" {
  resource_definition_id = module.iam_policy_sqs_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_consumer_policy_class
}

## Exposed passthrough resource definition
module "sqs_basic_consumer" {
  source = "../../humanitec-resource-defs/sqs/passthrough"

  prefix = local.res_def_prefix

  sqs_resource_class    = local.sqs_basic_class
  policy_resource_class = local.sqs_consumer_policy_class
}

resource "humanitec_resource_definition_criteria" "sqs_basic_consumer" {
  resource_definition_id = module.sqs_basic_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_consumer_class
}


# Required resources for workload identity

module "k8s_service_account" {
  source = "../../humanitec-resource-defs/k8s/service-account"

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "k8s_service_account" {
  resource_definition_id = module.k8s_service_account.id
  app_id                 = humanitec_application.example.id
}

module "iam_role_service_account" {
  source = "../../humanitec-resource-defs/iam-role/service-account"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  cluster_name = var.cluster_name
  prefix       = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "iam_role_service_account" {
  resource_definition_id = module.iam_role_service_account.id
  app_id                 = humanitec_application.example.id
}

module "workload" {
  source = "../../humanitec-resource-defs/workload/service-account"

  prefix = local.res_def_prefix
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = module.workload.id
  app_id                 = humanitec_application.example.id
}
