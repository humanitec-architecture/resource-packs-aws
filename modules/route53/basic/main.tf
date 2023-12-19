locals {
  types            = ["A", "AAAA", "CNAME"]
  provided_records = [var.ip_address, var.ipv6_address, var.name]
  records          = [for r in local.provided_records : r if r != ""]

  # If every record is empty, then the type is A, but this will be caught below.
  type = local.types[index(local.provided_records, length(local.records) > 0 ? local.records[0] : "")]
}

data "aws_route53_zone" "hosted_zone" {
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "main" {
  name    = "${var.subdomain}.${data.aws_route53_zone.hosted_zone.name}"
  zone_id = data.aws_route53_zone.hosted_zone.id
  type    = var.aws_hosted_zone == "" ? local.type : "A"

  ttl     = var.aws_hosted_zone == "" ? 300 : null
  records = var.aws_hosted_zone == "" ? local.records : null

  dynamic "alias" {
    for_each = var.aws_hosted_zone != "" ? [true] : []
    content {
      name                   = var.name
      zone_id                = var.aws_hosted_zone
      evaluate_target_health = false
    }
  }

  lifecycle {
    precondition {
      condition     = length(local.records) > 0
      error_message = "Only one of ip_address, ipv6_address, name is supported."
    }
  }
}