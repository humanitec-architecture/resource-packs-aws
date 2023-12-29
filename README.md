# AWS resource pack

---

:construction: __This pack is experimental and currently not recommended for production usage.__ :construction:

---

A collection of AWS resources ready to be used with [Humanitec](https://humanitec.com/).

The following resources are included:

* [iam-policy/ecr-create-repository](./humanitec-resource-defs/iam-policy/ecr-create-repository): IAM policy for to create ECR repositories.
* [iam-policy/s3-admin](./humanitec-resource-defs/iam-policy/s3-admin): IAM policy for admin access for a S3 bucket.
* [iam-policy/sqs-admin](./humanitec-resource-defs/iam-policy/sqs-admin): IAM policy for admin access for an SQS queue.
* [iam-role/service-account](./humanitec-resource-defs/iam-role/service-account): An assumable IAM role, by a k8s service account.
* [k8s/service-account](./humanitec-resource-defs/k8s/service-account): A k8s service account linked to an IAM role.
* [redis/basic](./humanitec-resource-defs/redis/basic): AWS ElastiCache resource.
* [s3/basic](./humanitec-resource-defs/s3/basic): A basic S3 bucket.
* [sqs/basic](./humanitec-resource-defs/sqs/basic): A basic SQS queue.
* [workload/service-account](./humanitec-resource-defs/workload/service-account): A workload service account.

The `humanitec-resource-defs` directory includes the respective resource definitions.

The `modules` directory includes the Terraform modules used by the [Humanitec Terraform Driver](https://developer.humanitec.com/integration-and-extensions/drivers/generic-drivers/terraform/) to provision the actual resources.

Checkout `examples/main.tf` for an example application using S3 & SQS.
