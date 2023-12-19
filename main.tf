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
<<<<<<< HEAD
  
=======






    
>>>>>>> 23055b5de8fc2b7ce95ff8104fc32d682c512ace
