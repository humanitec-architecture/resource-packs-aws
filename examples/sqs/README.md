<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 0 |

## Providers

| Name | Version |
|------|---------|
| humanitec | ~> 0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| iam\_policy\_s3\_admin | ../../humanitec-resource-defs/iam-policy/s3-admin | n/a |
| iam\_policy\_sqs\_admin | ../../humanitec-resource-defs/iam-policy/sqs-admin | n/a |
| iam\_role\_service\_account | ../../humanitec-resource-defs/iam-role/service-account | n/a |
| k8s\_service\_account | ../../humanitec-resource-defs/k8s/service-account | n/a |
| s3\_basic | ../../humanitec-resource-defs/s3/basic | n/a |
| sqs\_basic | ../../humanitec-resource-defs/sqs/basic | n/a |
| workload | ../../humanitec-resource-defs/workload/service-account | n/a |

## Resources

| Name | Type |
|------|------|
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.iam_policy_s3_admin](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.iam_policy_sqs_admin](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.iam_role_service_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.k8s_service_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.s3_basic](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.sqs_basic](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.workload](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | n/a | `string` | n/a | yes |
| oidc\_provider | n/a | `string` | n/a | yes |
| oidc\_provider\_arn | n/a | `string` | n/a | yes |
| secret\_key | n/a | `string` | n/a | yes |
| name | n/a | `string` | `"item-list"` | no |
| region | n/a | `string` | `"eu-central-1"` | no |
| resource\_packs\_aws\_rev | n/a | `string` | `"refs/heads/main"` | no |
<!-- END_TF_DOCS -->