<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| db | terraform-aws-modules/rds/aws | 6.3.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| database\_name | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| password | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| subnet\_ids | n/a | `set(string)` | n/a | yes |
| username | n/a | `string` | n/a | yes |
| vpc\_security\_group\_ids | n/a | `set(string)` | n/a | yes |
| allocated\_storage | n/a | `number` | `20` | no |
| backup\_retention\_period | n/a | `number` | `1` | no |
| backup\_window | n/a | `string` | `null` | no |
| create\_cloudwatch\_log\_group | n/a | `bool` | `false` | no |
| create\_db\_subnet\_group | n/a | `bool` | `true` | no |
| create\_monitoring\_role | n/a | `bool` | `true` | no |
| db\_subnet\_group\_name | DB subnet group name | `string` | `""` | no |
| deletion\_protection | n/a | `bool` | `false` | no |
| enabled\_cloudwatch\_logs\_exports | n/a | `set(string)` | `[]` | no |
| engine | n/a | `string` | `"postgres"` | no |
| engine\_version | n/a | `string` | `"14"` | no |
| group\_family | n/a | `string` | `"postgres14"` | no |
| instance\_class | n/a | `string` | `"db.t4g.large"` | no |
| maintenance\_window | n/a | `string` | `null` | no |
| major\_engine\_version | n/a | `string` | `"14"` | no |
| max\_allocated\_storage | n/a | `number` | `100` | no |
| monitoring\_interval | n/a | `number` | `60` | no |
| monitoring\_role\_description | n/a | `string` | `"Monitoring role for RDS cluster"` | no |
| monitoring\_role\_name | n/a | `string` | `"rds-monitoring-role"` | no |
| monitoring\_role\_use\_name\_prefix | n/a | `bool` | `true` | no |
| multi\_az | n/a | `bool` | `true` | no |
| name | Resource name | `string` | `""` | no |
| parameters | n/a | `set(any)` | `[]` | no |
| performance\_insights\_enabled | n/a | `bool` | `true` | no |
| performance\_insights\_retention\_period | n/a | `number` | `7` | no |
| port | n/a | `number` | `5432` | no |
| skip\_final\_snapshot | n/a | `bool` | `true` | no |

### Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| name | n/a |
| password | n/a |
| port | n/a |
| username | n/a |
<!-- END_TF_DOCS -->