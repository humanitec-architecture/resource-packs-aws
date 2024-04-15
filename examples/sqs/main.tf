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

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "sqs_basic" {
  resource_definition_id = module.sqs_basic.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_class

  force_delete = true
}

# Add different access policy to sqs basic queue

# Publisher

## Policy

module "iam_policy_sqs_publisher" {
  source = "../../humanitec-resource-defs/iam-policy/sqs"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  prefix             = var.prefix
  policy             = "publisher"
  sqs_resource_class = local.sqs_basic_publisher_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_sqs_publisher" {
  resource_definition_id = module.iam_policy_sqs_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_publisher_policy_class

  force_delete = true
}

## Exposed delegator resource definition
module "sqs_basic_publisher" {
  source = "../../humanitec-resource-defs/sqs/delegator"

  prefix = var.prefix

  sqs_resource_class    = local.sqs_basic_class
  policy_resource_class = local.sqs_publisher_policy_class
}

resource "humanitec_resource_definition_criteria" "sqs_basic_publisher" {
  resource_definition_id = module.sqs_basic_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_publisher_class

  force_delete = true
}

# Consumer

## Policy
module "iam_policy_sqs_consumer" {
  source = "../../humanitec-resource-defs/iam-policy/sqs"

  resource_packs_aws_url = var.resource_packs_aws_url
  resource_packs_aws_rev = var.resource_packs_aws_rev
  append_logs_to_error   = true
  driver_account         = humanitec_resource_account.humanitec_provisioner.id

  region = var.region

  policy = "consumer"

  prefix = var.prefix

  sqs_resource_class = local.sqs_basic_consumer_class
}

resource "humanitec_resource_definition_criteria" "iam_policy_sqs_consumer" {
  resource_definition_id = module.iam_policy_sqs_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_consumer_policy_class

  force_delete = true
}

## Exposed delegator resource definition
module "sqs_basic_consumer" {
  source = "../../humanitec-resource-defs/sqs/delegator"

  prefix = var.prefix

  sqs_resource_class    = local.sqs_basic_class
  policy_resource_class = local.sqs_consumer_policy_class
}

resource "humanitec_resource_definition_criteria" "sqs_basic_consumer" {
  resource_definition_id = module.sqs_basic_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.sqs_basic_consumer_class

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
