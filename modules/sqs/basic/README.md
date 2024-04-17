<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| sqs | terraform-aws-modules/sqs/aws | ~> 4 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| name | Resource name | `string` | `""` | no |

### Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| region | n/a |
| url | n/a |
<!-- END_TF_DOCS -->