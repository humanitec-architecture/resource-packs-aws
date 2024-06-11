# AWS resource pack

---

:construction: __This pack is experimental and currently not recommended for production usage.__ :construction:

---

The AWS Resource Pack contains various reference implementation of connecting AWS with [the Humanitec Platform Orchestrator](https://developer.humanitec.com/platform-orchestrator/overview/).

You can find more details about Resource Packs and how to use them [inside the Humanitec documentation](https://developer.humanitec.com/platform-orchestrator/resources/resource-packs/).

The following resources are included:

* [config/imagepullsecret](./humanitec-resource-defs/config/imagepullsecret): A `config` resource that configures [imagePullSecret](https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod) injection.
* [dns/basic](./humanitec-resource-defs/dns/basic): A `dns` resource using Route 53.
* [iam-policy/ecr-create-repository](./humanitec-resource-defs/iam-policy/ecr-create-repository): IAM policy for to create ECR repositories.
* [iam-policy/s3](./humanitec-resource-defs/iam-policy/s3): IAM policy for for an S3 bucket.
* [iam-policy/sqs](./humanitec-resource-defs/iam-policy/sqs): IAM policy for an SQS queue.
* [iam-role/service-account](./humanitec-resource-defs/iam-role/service-account): An assumable IAM role, by a k8s service account.
* [k8s/service-account](./humanitec-resource-defs/k8s/service-account): A `k8s-service-account` linked to an IAM role.
* [mysql/aurora](./humanitec-resource-defs/rds/aurora): A `mysql` resource using AWS RDS Aurora.
* [mysql/basic](./humanitec-resource-defs/rds/basic): A `mysql` resource using AWS RDS.
* [postgres/aurora](./humanitec-resource-defs/rds/aurora): A `postgres` resource using AWS RDS Aurora.
* [postgres/basic](./humanitec-resource-defs/rds/basic): A `postgres` resource using AWS RDS.
* [redis/basic](./humanitec-resource-defs/redis/basic): A `redis` resource using AWS ElastiCache.
* [s3/basic](./humanitec-resource-defs/s3/basic): A basic `s3` bucket.
* [sqs/basic](./humanitec-resource-defs/sqs/basic): A basic `sqs` queue.
* [workload/service-account](./humanitec-resource-defs/workload/service-account): Inject a k8s service account into a `workload`.

The `humanitec-resource-defs` directory includes the respective Resource Definitions.

The `modules` directory includes the Terraform modules used by the [Humanitec Terraform Driver](https://developer.humanitec.com/integration-and-extensions/drivers/generic-drivers/terraform/) to provision the actual resources.

Checkout `examples/` for example usage of the Resource Definitions listed above.
