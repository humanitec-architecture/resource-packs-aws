# Example: dns resource based on AWS Route 53

This example configures a [dns](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#dns) Resource Definition using AWS Route 53.

The created Resource Definition can be used in your Score file using:

```yaml
resources:
  ...
  dns:
    type: dns
```

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
| route53 | ../../humanitec-resource-defs/dns/basic | n/a |

## Resources

| Name | Type |
|------|------|
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.dns](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| hosted\_zone\_id | The id of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| name | Name of the example application | `string` | `"hum-rp-dns-example"` | no |
| prefix | Prefix of the created resources | `string` | `"hum-rp-dns-ex-"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
