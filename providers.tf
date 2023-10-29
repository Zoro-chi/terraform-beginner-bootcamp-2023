terraform {
  # cloud {
  #   organization = "junzy"
  #   workspaces {
  #     name = "terra-house-V"
  #   }
  # }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
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