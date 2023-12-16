variable "user_uuid" {
  description = "Unique identifier for the user"
  type        = string

  validation {
    condition     = length(regexall("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$", var.user_uuid)) > 0
    error_message = "Invalid user_uuid format. It should be in the form of UUID."
  }
}

variable "bucket_name" {
  description = "The bucket name of the S3 bucket"
  type        = string 


  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name)<= 63 &&
      can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    )
    error_message = "The bucket name must be between 3 and 63 characters, try again "
  }
}