# variables.tf

variable "subdomain_name" {
  description = "Subdomain name for your domain"
  type        = string
}

# main.tf

resource "aws_route53_zone" "example" {
  name = "javatech.com"
}

resource "aws_route53_record" "example" {
  name    = var.subdomain_name
  type    = "A"
  zone_id = aws_route53_zone.example.zone_id  # Replace with your hosted zone ID

  alias {
    name                   = aws_elb.example.dns_name  # Replace with your ELB or other alias target
    zone_id                = aws_elb.example.zone_id
    evaluate_target_health = false
  }
}

# outputs.tf (Optional)

output "subdomain_name_value" {
  value = var.subdomain_name
}

