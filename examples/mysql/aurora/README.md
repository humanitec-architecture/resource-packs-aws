# Example: mysql resource based on AWS RDS Aurora

## Configuration
This example configures a [mysql](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#mysql) Resource Definition using AWS RDS Aurora. A workload using the `mysql` resource to create database instance looks like:

```yaml
resources:
  ...
  db:
    type: mysql
```

## Infrastructure setup

```mermaid
graph TD;
  subgraph VPC
    database["MySQl AWS RDS Aurora instance"]
    subgraph EKS Cluster
      pod[workload pod]
    end
    database -- security group --> pod
  end
```

## Orchestrator setup

```mermaid
graph LR;
  workload_1 --> db_1["db_1, resource_type: mysql"]
  workload_2 --> db_2["db_2, resource_type: mysql"]
  workload_2 --> shared.db_1["shared.db_1, resource_type: mysql"]
  workload_3 --> shared.db_1["shared.db_1, resource_type: mysql"]
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |
| humanitec | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| humanitec | ~> 1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| mysql | ../../../humanitec-resource-defs/mysql/aurora | n/a |

## Resources

| Name | Type |
|------|------|
| [humanitec_application.app](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_definition_criteria.mysql](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | AWS Access Key | `string` | n/a | yes |
| k8s\_node\_security\_group\_id | AWS Security Group ID of the kubernetes nodes to allow access to the AWS RDS cluster | `string` | n/a | yes |
| region | AWS Region to create resources | `string` | n/a | yes |
| secret\_key | AWS Secret Key | `string` | n/a | yes |
| subnet\_ids | AWS Subnet IDs to use for the AWS RDS cluster | `set(string)` | n/a | yes |
| vpc\_id | AWS VPC ID | `string` | n/a | yes |
| name | Name of the example application | `string` | `"hum-rp-mysql-example"` | no |
| prefix | Prefix of the created resources | `string` | `"hum-rp-mysql-ex-"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
