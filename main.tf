 # making changes to this file as a test exercise
terraform {

  #cloud {
    #organization = "vikikef2"
 
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
  
