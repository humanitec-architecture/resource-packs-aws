module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name            = var.prefix
  use_name_prefix = true
}
