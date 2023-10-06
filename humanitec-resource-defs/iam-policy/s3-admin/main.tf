resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}iam-policy-s3-admin"
  name        = "${var.prefix}iam-policy-s3-admin"
  type        = "aws-policy"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/iam-policy/s3-admin"
        rev  = var.resource_packs_aws_rev
        url  = "https://github.com/humanitec-architecture/resource-packs-aws.git"
      }

      variables = {
        region        = var.region,
        prefix        = "${var.prefix}$${context.res.id}"
        s3_bucket_arn = "$${resources['s3.${var.s3_resource_definition_class}'].outputs.arn}"

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
      }
    })
  }
}
