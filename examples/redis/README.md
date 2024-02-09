# Example: redis resource based on AWS ElastiCache

This example configures a [redis](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#redis) Resource Definition using AWS ElastiCache.

The created Resource Definition can be used in your Score file using:

```yaml
resources:
  ...
  redis:
    type: redis
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
| redis | ../../humanitec-resource-defs/redis/basic | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_ingress_rule.k8s_node_redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.redis](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| k8s\_node\_security\_group\_id | AWS Security Group ID of the kubernetes nodes to allow access to the AWS ElastiCache cluster | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| subnet\_ids | AWS Subnet IDs to use for the AWS ElastiCache cluster | `set(string)` | n/a | yes |
| vpc\_id | AWS VPC ID | `string` | n/a | yes |
| name | Name of the example application | `string` | `"redis-test"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
