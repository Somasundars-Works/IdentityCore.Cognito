module "identity" {
  source = "../cognito-identity"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  name          = "somasundars"
  domain_prefix = "somasundars-auth"

  callback_urls = [
    "http://localhost:4200/auth/callback"
  ]

  logout_urls = [
    "http://localhost:4200/"
  ]

  api_identifier = "somasundars-api"

  api_scopes = {
    "urls.read"  = "Read orders"
    "urls.write" = "Create or update orders"
    "urls.admin" = "Administrative order operations"
  }

  user_groups = [
    "Administrators",
    "Users"
  ]

  machine_clients = {
    urls-service = {
      scopes = ["urls.read", "urls.write"]
    }

    reporting-service = {
      scopes = ["urls.read"]
    }
  }

  custom_domain     = "identity.somasundars.com"
  route53_zone_name = "somasundars.com"
}
