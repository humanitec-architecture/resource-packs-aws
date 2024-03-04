# Example: sqs resource based on AWS SQS

This example configures a [sqs](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#sqs) Resource Definition using AWS SQS, with two different access policies:

* `basic-publisher` (allowed to send messages)
* `basic-consumer` (allowed to receive messages)

Those Resource Definitions can be used in your Score file using:

```yaml
resources:
  ...
  queue:
    type: sqs
    class: basic-publisher
```

The Resource Graph is using [delegator resources](https://developer.humanitec.com/platform-orchestrator/examples/resource-graph-patterns/#delegator-resource) to expose shared resources with different access policies.

The workload service account will automatically be assigned the necessary AWS IAM Role with the selected IAM Policy.

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
| iam\_policy\_sqs\_consumer | ../../humanitec-resource-defs/iam-policy/sqs | n/a |
| iam\_policy\_sqs\_publisher | ../../humanitec-resource-defs/iam-policy/sqs | n/a |
| iam\_role\_service\_account | ../../humanitec-resource-defs/iam-role/service-account | n/a |
| k8s\_service\_account | ../../humanitec-resource-defs/k8s/service-account | n/a |
| sqs\_basic | ../../humanitec-resource-defs/sqs/basic | n/a |
| sqs\_basic\_consumer | ../../humanitec-resource-defs/sqs/delegator | n/a |
| sqs\_basic\_publisher | ../../humanitec-resource-defs/sqs/delegator | n/a |
| workload | ../../humanitec-resource-defs/workload/service-account | n/a |

## Resources

| Name | Type |
|------|------|
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.iam_policy_sqs_consumer](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.iam_policy_sqs_publisher](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.iam_role_service_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.k8s_service_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.sqs_basic](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.sqs_basic_consumer](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.sqs_basic_publisher](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.workload](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| cluster\_name | Name of the EKS cluster | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| name | Name of the example application | `string` | `"hum-rp-s3-example"` | no |
| prefix | Prefix of the created resources | `string` | `"hum-rp-s3-ex-"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
