terraform {
  # cloud {
  #   organization = "junzy"
  #   workspaces {
  #     name = "terra-house-V"
  #   }
  # }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {

}

provider "random" {
  # Configuration options
}