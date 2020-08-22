data "aws_route53_zone" "iaclab" {
  name = "iaclab.net."
}

resource "aws_route53_record" "manager" {
  zone_id = data.aws_route53_zone.iaclab.zone_id
  name    = "proxy.${data.aws_route53_zone.iaclab.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.manager.public_ip]
}

resource "aws_route53_record" "nextcloud" {
  zone_id = data.aws_route53_zone.iaclab.zone_id
  name    = "sync.${data.aws_route53_zone.iaclab.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["proxy.${data.aws_route53_zone.iaclab.name}"]
}
