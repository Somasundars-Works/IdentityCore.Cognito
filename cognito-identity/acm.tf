resource "aws_acm_certificate" "cognito" {
  provider          = aws.us_east_1
  domain_name       = var.custom_domain
  validation_method = "DNS"
}
