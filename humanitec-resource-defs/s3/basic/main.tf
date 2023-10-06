resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}s3-basic"
  name        = "${var.prefix}s3-basic"
  type        = "s3"

  provision = {
    for s in var.policy_classes : "aws-policy.${s}" => {
      match_dependents = true
      is_dependent     = false
    }
  }

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/s3/basic"
        rev  = var.resource_packs_aws_rev
        url  = "https://github.com/humanitec-architecture/resource-packs-aws.git"
      }

      variables = {
        region = var.region,
        # TODO: How to template the bucket name?
        # Name restrictions https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
        # prefix = "${var.prefix}$${context.res.id}"
        prefix = "${var.prefix}basic-bucket"

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
      }
    })
  }
}
