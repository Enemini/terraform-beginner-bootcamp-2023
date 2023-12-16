 # making changes to this file as a test exercise
terraform {
 
  #cloud {
    #organization = "vikikef2"

    #workspaces{
      #name = "terra-house-1"
    #}
  #}

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

        aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}