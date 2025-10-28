variable "realm_id" {
  description = "Keycloak realm ID"
  type        = string
}

variable "audience_client_id" {
  description = "The Keycloak client ID of the audience"
  type        = string
}

# variable "name" {
#   description = "Name of the scope"
#   type        = string
# }
#
# variable "description" {
#   description = "Description of the scope"
#   type        = string
# }
#
# variable "consent_screen_text" {
#   description = "The text that should be displayed to the user on the consent screen"
#   type        = string
# }
#
# variable "gui_order" {
#   description = "The order in which this scope will be displayed in the consent screen"
#   type        = number
# }

variable "scope" {
  description = "The settings for the scope"
  type = object({
    name                = string
    description         = string
    consent_screen_text = string
    gui_order           = number
    # include_in_token    = optional(bool)  # Can override per-scope
  })
}
