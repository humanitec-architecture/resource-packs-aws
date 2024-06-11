# Humanitec Resource Definition: config/imagepullsecrets

## Terraform docs

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 1.0 |

### Providers

| Name | Version |
|------|---------|
| humanitec | ~> 1.0 |

### Resources

| Name | Type |
|------|------|
| [humanitec_resource_definition.main](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key\_id\_ref | AWS Access Key ID (Secret Store reference) | <pre>object({<br>    ref     = optional(string)<br>    store   = optional(string)<br>    value   = optional(string)<br>    version = optional(string)<br>  })</pre> | n/a | yes |
| account\_id | The id of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| secret\_access\_key\_ref | AWS Secret Access Key (Secret Store reference) | <pre>object({<br>    ref     = optional(string)<br>    store   = optional(string)<br>    value   = optional(string)<br>    version = optional(string)<br>  })</pre> | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->
