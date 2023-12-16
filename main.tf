 # making changes to this file as a test exercise
terraform {
 
  cloud {
    organization = "vikikef2"

    workspaces{
      name = "terra-house-1"
    }
  }

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

resource "random_string" "bucket_name" {
  #https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
  lower = true
  upper = false
  length  = 24
  special = false
}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  #bucket naming rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result

  tags = {
      UserUUID = "var.user_uuid"

  }

}




    
