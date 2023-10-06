output "arn" {
  value = module.sqs.queue_arn
}

output "url" {
  value = module.sqs.queue_url
}

output "region" {
  value = var.region
}
