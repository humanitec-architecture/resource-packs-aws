<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | n/a | `string` | n/a | yes |
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| secret\_key | n/a | `string` | n/a | yes |
| force\_destroy | n/a | `bool` | `true` | no |
| name | Resource name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| bucket | n/a |
| region | n/a |
<!-- END_TF_DOCS -->