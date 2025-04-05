data "aws_route53_zone" "main" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "service1" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "service1.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns]
}

resource "aws_route53_record" "service2" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "service2.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns]
}
