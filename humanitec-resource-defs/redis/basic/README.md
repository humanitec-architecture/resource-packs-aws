<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| humanitec | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [humanitec_resource_definition.main](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| security\_group\_ids | List of AWS security group IDs to use for the AWS ElastiCache cluster | `set(string)` | n/a | yes |
| subnet\_group\_name | Name of the AWS ElastiCache subnet group to use | `string` | n/a | yes |
| name | Resource name (can contain placeholders like ${context.app.id}) | `string` | `""` | no |
| node\_type | AWS ElastiCache node type | `string` | `"cache.t4g.micro"` | no |
| num\_cache\_clusters | Number of AWS ElastiCache clusters | `number` | `1` | no |
| parameter\_group\_name | AWS ElastiCache parameter group name | `string` | `"default.redis7.cluster.on"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->