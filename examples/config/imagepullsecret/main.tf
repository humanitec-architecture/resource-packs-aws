# AWS IAM user used by the k8s-cluster to pull images from ECR

resource "aws_iam_user" "cluster_ecr_pull" {
  name = "cluster_ecr_pull"
}

resource "aws_iam_user_policy_attachment" "cluster_ecr_pull" {
  user = aws_iam_user.cluster_ecr_pull.name
  # https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryReadOnly
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_access_key" "cluster_ecr_pull" {
  user = aws_iam_user.cluster_ecr_pull.name

  # Ensure that the policy is not deleted before the access key
  depends_on = [aws_iam_user_policy_attachment.cluster_ecr_pull]
}

# Store the access key and secret in AWS Secrets Manager for the Humanitec Operator to be able to fetch them.

locals {
  ecr_pull_secrets = {
    aws-access-key-id     = aws_iam_access_key.cluster_ecr_pull.id
    aws-secret-access-key = aws_iam_access_key.cluster_ecr_pull.secret
  }

  ecr_pull_secret_refs = {
    for key, value in local.ecr_pull_secrets : key => {
      ref     = aws_secretsmanager_secret.ecr_pull[key].name
      store   = var.humanitec_secret_store_id
      version = aws_secretsmanager_secret_version.ecr_pull[key].version_id
    }
  }
}

resource "aws_secretsmanager_secret" "ecr_pull" {
  for_each = local.ecr_pull_secrets
  name     = "humanitec-ecr-pull-secret-${each.key}"
}

resource "aws_secretsmanager_secret_version" "ecr_pull" {
  for_each = local.ecr_pull_secrets

  secret_id     = aws_secretsmanager_secret.ecr_pull[each.key].id
  secret_string = each.value
}

# Example application and resource definition criteria

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

# Current AWS Account ID
data "aws_caller_identity" "current" {}

locals {
  imagepullsecret_config_res_id = "imagepullsecret"
}

module "imagepullsecret" {
  source = "../../../humanitec-resource-defs/config/imagepullsecret"

  prefix = var.prefix

  account_id            = data.aws_caller_identity.current.account_id
  region                = var.region
  access_key_id_ref     = local.ecr_pull_secret_refs["aws-access-key-id"]
  secret_access_key_ref = local.ecr_pull_secret_refs["aws-secret-access-key"]
}

resource "humanitec_resource_definition_criteria" "imagepullsecret" {
  resource_definition_id = module.imagepullsecret.id
  app_id                 = humanitec_application.example.id
  res_id                 = local.imagepullsecret_config_res_id
  class                  = "default"

  force_delete = true
}

resource "humanitec_resource_definition" "workload" {
  driver_type = "humanitec/template"
  id          = "${var.prefix}workload"
  name        = "${var.prefix}workload"
  type        = "workload"

  driver_inputs = {
    values_string = jsonencode({
      templates = {
        outputs = <<EOL
update:
- op: add
  path: /spec/imagePullSecrets
  value:
    - name: $${resources["config.default#${local.imagepullsecret_config_res_id}"].outputs.secret_name}
EOL
      }
    })
  }
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = humanitec_resource_definition.workload.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}
