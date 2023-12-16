variable "user_uuid" {
  description = "Unique identifier for the user"
  type        = string

  validation {
    condition     = length(regexall("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$", var.user_uuid)) > 0
    error_message = "Invalid user_uuid format. It should be in the form of UUID."
  }
}
