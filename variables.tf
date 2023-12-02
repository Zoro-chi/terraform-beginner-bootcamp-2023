variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

variable "capex_villans" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "crypto_punks" {
  type = object({
    public_path = string
    content_version = number
  })
}