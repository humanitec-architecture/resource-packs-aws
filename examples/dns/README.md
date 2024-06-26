# Example: dns resource based on AWS Route 53

## Configuration

This example configures a [dns](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#dns) Resource Definition using AWS Route 53. A workload using the `dns` resource to create dns records looks like:

```yaml
resources:
  ...
  dns:
    type: dns
```

## Infrastructure setup

```mermaid
graph TD;
  subgraph AWS Hosted zone
    record["record"]
  end

  subgraph EKS Cluster
    pod[workload pod]
  end
  record --> pod
```

## Orchestrator setup

```mermaid
graph LR;
  workload_1 --> dns_1["dns_1, resource_type: dns"]
  workload_2 --> dns_2["dns_2, resource_type: dns"]
  workload_2 --> shared.dns_1["shared.dns_1, resource_type: dns"]
  workload_3 --> shared.dns_1["shared.dns_1, resource_type: dns"]
```

## Terraform docs

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 5.0 |
| humanitec | ~> 1.0 |
| random | ~> 3.5 |

### Providers

| Name | Version |
|------|---------|
| aws | ~> 5.0 |
| humanitec | ~> 1.0 |
| random | ~> 3.5 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| route53 | ../../humanitec-resource-defs/dns/basic | n/a |

### Resources

| Name | Type |
|------|------|
| [aws_iam_role.humanitec_provisioner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.humanitec_provisioner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_account.humanitec_provisioner](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_account) | resource |
| [humanitec_resource_definition_criteria.dns](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [random_password.external_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_iam_policy_document.instance_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hosted\_zone\_id | The id of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| name | Name of the example application | `string` | `"hum-rp-dns-example"` | no |
| prefix | Prefix of the created resources | `string` | `"hum-rp-dns-ex-"` | no |
| resource\_packs\_aws\_rev | AWS Resource Pack git branch | `string` | `"refs/heads/main"` | no |
| resource\_packs\_aws\_url | AWS Resource Pack git url | `string` | `"https://github.com/humanitec-architecture/resource-packs-aws.git"` | no |
<!-- END_TF_DOCS -->
