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

## Resources

| Name | Type |
|------|------|
| [humanitec_resource_definition.main](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | n/a | `string` | n/a | yes |
| policy | Name of the exposed policy | `string` | n/a | yes |
| prefix | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | n/a | yes |
| s3\_resource\_class | n/a | `string` | n/a | yes |
| secret\_key | n/a | `string` | n/a | yes |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->