resource "aws_route53_record" "jenkins" {
  zone_id = "Z0045854YDGM9D8OH98O"
  name    = "jenkins.altaidevops.com"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.jenkins.public_ip]
}