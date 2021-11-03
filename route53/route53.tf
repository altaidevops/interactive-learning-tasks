
resource "aws_route53_zone" "primary" {
  name = "altaidevops.com"
}

resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "blog.altaidevops.com"
  type    = "A"
  ttl     = "300"
  records = ["127.0.0.1"]
}