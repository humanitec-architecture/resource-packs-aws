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
| access\_key | AWS Access Key | `string` | n/a | yes |
| hosted\_zone | The name of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| subdomain | The subdomain of the DNS name that the DNS record is for. | `string` | n/a | yes |
| alias\_evaluate\_target\_health | Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set. | `bool` | `false` | no |
| alias\_name | DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone. | `string` | `""` | no |
| alias\_zone\_id | Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. | `string` | `""` | no |
| ip\_address | The IPv4 address that the DNS name should resolve to. | `string` | `""` | no |
| ipv6\_address | The IPv6 address that the DNS name should resolve to. | `string` | `""` | no |
| name | A valid fully qualified domain name that the DNS name should resolve to. | `string` | `""` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->