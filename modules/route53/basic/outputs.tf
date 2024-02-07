output "host" {
  value = var.aws_hosted_zone != "" ? aws_route53_record.alias-record[0].name : aws_route53_record.non-alias-record[0].name
}
