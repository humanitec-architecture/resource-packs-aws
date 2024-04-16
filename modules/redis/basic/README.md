<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |
| random | ~> 3.5 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 5.0 |
| random | ~> 3.5 |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [random_password.auth_token](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| security\_group\_ids | List of AWS security group IDs to use for the AWS ElastiCache cluster | `set(string)` | n/a | yes |
| subnet\_group\_name | Name of the AWS ElastiCache subnet group to use | `string` | n/a | yes |
| name | Resource name | `string` | `""` | no |
| node\_type | AWS ElastiCache node type | `string` | `"cache.t4g.micro"` | no |
| num\_cache\_clusters | Number of AWS ElastiCache clusters | `number` | `1` | no |
| parameter\_group\_name | AWS ElastiCache parameter group name | `string` | `"default.redis7.cluster.on"` | no |
| port | Port to use for the AWS ElastiCache cluster | `number` | `6379` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| password | n/a |
| port | n/a |
| username | n/a |
<!-- END_TF_DOCS -->