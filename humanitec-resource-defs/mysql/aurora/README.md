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
| database\_name | n/a | `string` | n/a | yes |
| driver\_account | The ID of the Resource Account which should be used. | `string` | n/a | yes |
| master\_password | n/a | `string` | n/a | yes |
| master\_username | n/a | `string` | n/a | yes |
| prefix | Prefix for all resources | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | n/a | yes |
| subnets | n/a | `set(string)` | n/a | yes |
| vpc | n/a | `string` | n/a | yes |
| append\_logs\_to\_error | Append Terraform logs to error messages. | `bool` | `false` | no |
| apply\_immediately | n/a | `bool` | `true` | no |
| create\_cloudwatch\_log\_group | n/a | `bool` | `false` | no |
| create\_db\_cluster\_activity\_stream | n/a | `bool` | `false` | no |
| create\_db\_subnet\_group | n/a | `bool` | `true` | no |
| db\_cluster\_activity\_stream\_kms\_key\_id | n/a | `string` | `null` | no |
| db\_cluster\_activity\_stream\_mode | n/a | `string` | `"async"` | no |
| db\_cluster\_parameter\_group\_parameters | n/a | `set(any)` | `[]` | no |
| db\_parameter\_group\_parameters | n/a | `set(any)` | `[]` | no |
| db\_subnet\_group\_name | DB subnet group name (can contain placeholders like ${context.app.id}) | `string` | `""` | no |
| enabled\_cloudwatch\_logs\_exports | n/a | `set(string)` | `[]` | no |
| endpoints | n/a | `any` | `{}` | no |
| engine | n/a | `string` | `"aurora-mysql"` | no |
| engine\_version | n/a | `string` | `"8.0"` | no |
| group\_family | n/a | `string` | `"aurora-mysql8.0"` | no |
| instances | n/a | `map(any)` | <pre>{<br>  "1": {<br>    "db_parameter_group_name": "default.aurora-mysql8.0",<br>    "instance_class": "db.r5.2xlarge",<br>    "publicly_accessible": true<br>  },<br>  "2": {<br>    "identifier": "static-member-1",<br>    "instance_class": "db.r5.2xlarge"<br>  }<br>}</pre> | no |
| name | Resource name (can contain placeholders like ${context.app.id}) | `string` | `""` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
| security\_group\_rules | n/a | `any` | `{}` | no |
| skip\_final\_snapshot | n/a | `bool` | `true` | no |
| storage\_encrypted | n/a | `bool` | `true` | no |
| storage\_type | n/a | `string` | `"aurora"` | no |
| type | n/a | `string` | `"mysql"` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->