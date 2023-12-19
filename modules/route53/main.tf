resource "aws_route53_zone" "zone" {
  name = var.dns_zone
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.dns_name
  type    = var.dns_type
  ttl     = var.dns_ttl
  records = aws_route53_zone.zone.name_servers
}
