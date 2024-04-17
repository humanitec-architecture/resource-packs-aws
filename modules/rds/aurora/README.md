<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| aurora | terraform-aws-modules/rds-aurora/aws | 9.0.0 |
| kms | terraform-aws-modules/kms/aws | ~> 2.1 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| database\_name | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| master\_password | n/a | `string` | n/a | yes |
| master\_username | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| subnets | n/a | `set(string)` | n/a | yes |
| vpc | n/a | `string` | n/a | yes |
| apply\_immediately | n/a | `bool` | `true` | no |
| create\_cloudwatch\_log\_group | n/a | `bool` | `false` | no |
| create\_db\_cluster\_activity\_stream | n/a | `bool` | `false` | no |
| create\_db\_subnet\_group | n/a | `bool` | `true` | no |
| db\_cluster\_activity\_stream\_kms\_key\_id | n/a | `string` | `null` | no |
| db\_cluster\_activity\_stream\_mode | n/a | `string` | `"async"` | no |
| db\_cluster\_parameter\_group\_parameters | n/a | `set(any)` | `[]` | no |
| db\_parameter\_group\_parameters | n/a | `set(any)` | `[]` | no |
| db\_subnet\_group\_name | DB subnet group name | `string` | `""` | no |
| enabled\_cloudwatch\_logs\_exports | n/a | `set(string)` | `[]` | no |
| endpoints | n/a | `any` | `{}` | no |
| engine | n/a | `string` | `"aurora-postgresql"` | no |
| engine\_version | n/a | `string` | `"14.7"` | no |
| group\_family | n/a | `string` | `"aurora-postgresql14"` | no |
| instances | n/a | `map(any)` | <pre>{<br>  "1": {<br>    "db_parameter_group_name": "default.aurora-postgresql14",<br>    "instance_class": "db.r5.2xlarge",<br>    "publicly_accessible": true<br>  },<br>  "2": {<br>    "identifier": "static-member-1",<br>    "instance_class": "db.r5.2xlarge"<br>  }<br>}</pre> | no |
| name | Resource name | `string` | `""` | no |
| security\_group\_rules | n/a | `any` | `{}` | no |
| skip\_final\_snapshot | n/a | `bool` | `true` | no |
| storage\_encrypted | n/a | `bool` | `true` | no |
| storage\_type | n/a | `string` | `"aurora"` | no |

### Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| name | n/a |
| password | n/a |
| port | n/a |
| username | n/a |
<!-- END_TF_DOCS -->