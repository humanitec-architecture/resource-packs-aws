resource "humanitec_resource_definition" "main" {
  id   = "${var.prefix}k8s-service-account"
  name = "${var.prefix}k8s-service-account"
  type = "k8s-service-account"

  driver_type = "humanitec/template"
  driver_inputs = {
    secrets_string = jsonencode({
      templates = {
        # outputs = ""
      }
    })

    values_string = jsonencode({
      templates = {
        # cookie    = ""
        init      = ""
        manifests = <<EOL
serviceaccount.yaml:
  data:
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: $${resources.aws-role.outputs.k8s_service_account_name}
      annotations:
        {{- if "$${resources.aws-role.outputs.role_arn}}" }}
        eks.amazonaws.com/role-arn: $${resources.aws-role.outputs.role_arn}
        {{- end }}
        context: {{trimPrefix "modules." "$${context.res.id}"}}
        res: $${context.res.id}
        app: $${context.app.id}
        env: $${context.env.id}
  location: namespace
EOL
        outputs   = <<EOL
name: $${resources.aws-role.outputs.k8s_service_account_name}
EOL
      }
    })
  }
}
