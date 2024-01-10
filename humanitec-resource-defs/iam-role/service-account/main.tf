resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}aws-workload-role"
  name        = "${var.prefix}aws-workload-role"
  type        = "aws-role"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        access_key = var.access_key
        secret_key = var.secret_key
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/iam-role/service-account"
        rev  = var.resource_packs_aws_rev
        url  = var.resource_packs_aws_url
      }

      variables = {
        region            = var.region,
        prefix            = "${var.prefix}$${context.res.id}"
        policy_arns       = "$${resources.workload>aws-policy.outputs.arn}"
        oidc_provider     = var.oidc_provider
        oidc_provider_arn = var.oidc_provider_arn
        namespace         = "$${resources.k8s-namespace#k8s-namespace.outputs.namespace}"

        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
      }
    })
  }
}
