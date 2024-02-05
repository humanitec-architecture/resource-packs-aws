locals {
  types            = ["A", "AAAA", "CNAME", "ALIAS"]
  provided_records = [var.ip_address, var.ipv6_address, var.name, var.alias_name]
  records          = [for r in local.provided_records : r if r != ""]

  # If every record is empty, then the type is A, but this will be caught below.
  type = local.types[index(local.provided_records, length(local.records) > 0 ? local.records[0] : "")]
}

data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone
}

resource "aws_route53_record" "non-alias-record" {
  count = local.type != "ALIAS" ? 1 : 0

  name    = "${var.subdomain}.${var.hosted_zone}"
  zone_id = data.aws_route53_zone.hosted_zone.id
  type    = local.type

  ttl     = 300
  records = local.records

  lifecycle {
    precondition {
      condition     = length(local.records) > 0
      error_message = "Only one of ip_address, ipv6_address, name or alias is supported."
    }
  }
}

resource "aws_route53_record" "alias-record" {
  count = local.type == "ALIAS" ? 1 : 0

  name    = "${var.subdomain}.${var.hosted_zone}"
  zone_id = data.aws_route53_zone.hosted_zone.id
  type    = "A"

  alias {
    name                   = var.alias_name
    zone_id                = var.alias_zone_id
    evaluate_target_health = var.alias_evaluate_target_health
  }

  lifecycle {
    precondition {
      condition     = length(local.records) > 0
      error_message = "Only one of ip_address, ipv6_address, name or alias is supported."
    }

    precondition {
      condition     = var.alias_name != "" && var.alias_zone_id != "" && var.alias_evaluate_target_health != ""
      error_message = "All of alias_name, alias_zone_id and alias_evaluate_target_health has to be provided"
    }
  }
}
