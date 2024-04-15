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
| [aws_route53_record.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| hosted\_zone\_id | The id of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| subdomain | The subdomain of the DNS name that the DNS record is for. | `string` | n/a | yes |
| aws\_hosted\_zone | Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. | `string` | `""` | no |
| ip\_address | The IPv4 address that the DNS name should resolve to. | `string` | `""` | no |
| ipv6\_address | The IPv6 address that the DNS name should resolve to. | `string` | `""` | no |
| name | A valid fully qualified domain name that the DNS name should resolve to. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | n/a |
<!-- END_TF_DOCS -->