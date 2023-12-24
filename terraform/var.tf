locals {
  origin_id = "my-origin-id"
}

variable "cloudfront_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "component_name" {
  description = "Name of the component"
  type        = string
}

variable "common_value" {
  description = "Common value"
  type        = string
  default     = "default_value"
}

# Outputs for demonstration purposes:
output "local_origin_id" {
  value = local.origin_id
}

output "cf_price_class" {
  value = var.cloudfront_price_class
}

output "comp_name" {
  value = var.component_name
}

output "common_val" {
  value = var.common_value
}
