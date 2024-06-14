locals {
  secret_name = "ecr-pull-secret"
}

resource "humanitec_resource_definition" "main" {
  id          = "${var.prefix}config-imagepullsecret"
  name        = "${var.prefix}config-imagepullsecret"
  type        = "config"
  driver_type = "humanitec/template"

  driver_inputs = {
    secret_refs = jsonencode({
      "AWS_ACCESS_KEY_ID"     = var.access_key_id_ref
      "AWS_SECRET_ACCESS_KEY" = var.secret_access_key_ref
    })

    values_string = jsonencode({
      secret_name    = local.secret_name
      server         = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com"
      aws_account_id = var.account_id
      aws_region     = var.region
      namespace      = "$${resources[\"k8s-namespace.default#k8s-namespace\"].outputs.namespace}"

      templates = {
        manifests = file("${path.module}/templates/manifests.yaml")
        outputs   = <<EOL
secret_name: {{ .driver.values.secret_name }}
EOL
      }
    })
  }
}
