# Fetch Route 53 Zone Name
data "aws_route53_zone" "zone" {
  name = "javatech.com"  # Replace with your domain name or hosted zone name
}

# Fetch ACM Certificate ARN
data "aws_acm_certificate" "certificate" {
  domain = "javatech.com"  # Replace with your domain or certificate name
}

# Output Route 53 Zone Name
output "route53_zone_name" {
  value = data.aws_route53_zone.zone.name
}

# Output ACM Certificate ARN
output "acm_certificate_arn" {
  value = data.aws_acm_certificate.certificate.arn
}