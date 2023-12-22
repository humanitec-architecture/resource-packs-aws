module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 4"

  name            = var.prefix
  use_name_prefix = true
}
