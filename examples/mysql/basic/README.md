# Example: mysql resource based on AWS RDS

This example configures a [mysql](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#mysql) Resource Definition using AWS RDS.

The created Resource Definition can be used in your Score file using:

```yaml
resources:
  ...
  db:
    type: mysql
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |
| humanitec | ~> 0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 5.0 |
| humanitec | ~> 0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| mysql | ../../../humanitec-resource-defs/mysql/basic | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_ingress_rule.k8s_node_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [humanitec_application.app](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.mysql](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| humanitec\_org\_id | Humanitec organization where resource definitions will be applied | `string` | n/a | yes |
| humanitec\_token | Humanitec API token | `string` | n/a | yes |
| k8s\_node\_security\_group\_id | AWS Security Group ID of the kubernetes nodes to allow access to the AWS RDS cluster | `string` | n/a | yes |
| name | Name that will be used in resouces' names | `string` | n/a | yes |
| region | AWS Region to create resources | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| subnet\_ids | AWS Subnet IDs to use for the AWS RDS cluster | `set(string)` | n/a | yes |
| vpc\_id | AWS VPC ID | `string` | n/a | yes |
| humanitec\_host | Humanitec API host url | `string` | `"https://api.humanitec.io"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
