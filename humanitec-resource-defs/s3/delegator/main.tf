resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/template"
  id          = "${var.prefix}s3-${var.s3_resource_class}-${var.policy_resource_class}"
  name        = "${var.prefix}s3-${var.s3_resource_class}-${var.policy_resource_class}"
  type        = "s3"

  driver_inputs = {
    values_string = jsonencode({
      templates = {
        outputs = <<EOL
bucket: "$${resources['s3.${var.s3_resource_class}'].outputs.bucket}"
region: "$${resources['s3.${var.s3_resource_class}'].outputs.region}"
arn: "$${resources['s3.${var.s3_resource_class}'].outputs.arn}"
EOL
      }
    })
  }

  provision = {
    "aws-policy.${var.policy_resource_class}" = {
      match_dependents = true
      is_dependent     = false
    }
  }
}
