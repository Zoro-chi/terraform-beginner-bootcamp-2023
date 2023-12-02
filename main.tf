terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "junzy"
    workspaces {
      name = "terra-house-V"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_capex_villans" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.capex_villans.public_path
  content_version = var.capex_villans.content_version
}

resource "terratowns_home" "home_capex_villans" {
  name = "Capex Villans HQ"
  description = <<DESCRIPTION
Welcome to the future of FPS gaming. A new battle royale experience.
DESCRIPTION
  domain_name = module.home_capex_villans.domain_name
  town = "missingo"
  content_version = var.capex_villans.content_version
}

module "home_crpto_punks" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.crypto_punks.public_path
  content_version = var.crypto_punks.content_version
}

resource "terratowns_home" "home_crpto_punks" {
  name = "Crypto Punks"
  description = <<DESCRIPTION
The home of the craziest crypto punks in the world.
DESCRIPTION
  domain_name = module.home_crpto_punks.domain_name
  town = "missingo"
  content_version = var.crypto_punks.content_version
}