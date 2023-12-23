# Create CloudFront distribution
resource "aws_cloudfront_distribution" "ec2_distribution" {
  origin {
    domain_name = aws_instance.example.public_ip
    origin_id   = "origin-example"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "EC2 Docker frontend"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "origin-example"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # More settings can be added based on your requirements
}
