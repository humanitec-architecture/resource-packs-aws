locals {
  # Name restrictions https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-queues.html
  default_name = trimsuffix(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 80), "-")
}


module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 4"

  name = coalesce(var.name, local.default_name)
}
