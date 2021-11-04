output "zone-id" {
  value = aws_route53_record.blog.zone_id
}

output "zone-name" {
  value = aws_route53_record.blog.name
}

output "zone-records" {
  value = aws_route53_record.blog.records
}