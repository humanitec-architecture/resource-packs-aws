resource "humanitec_resource_definition" "main" {
  id   = "${var.prefix}workload"
  name = "${var.prefix}workload"
  type = "workload"

  driver_type = "humanitec/template"
  driver_inputs = {
    values_string = jsonencode({
      templates = {
        # cookie    = ""
        init    = ""
        outputs = <<EOL
update:
  - op: add
    path: /spec/serviceAccountName
    value: $${resources.k8s-service-account.outputs.name}
EOL
      }
    })
  }
}
