terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  # cloud {
  #   organization = "junzy"
  #   workspaces {
  #     name = "terra-house-V"
  #   }
  # }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

resource "terratowns_home" "home" {
  name = "Capex Villans HQ"
  description = <<DESCRIPTION
Welcome to the future of FPS gaming. A new battle royale experience.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name = "3thn6yx.cloudfront.net"
  town = "missingo"
  content_version = 1
}