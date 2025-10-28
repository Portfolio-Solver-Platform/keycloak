variable "realm_id" {
  description = "Keycloak realm ID"
  type        = string
}

variable "client_id" {
  description = "The Keycloak client ID"
  type        = string
}

variable "scope" {
  description = "The settings for the scope"
  type = object({
    # Name of the scope
    name                = string

    # Description of the scope
    description         = string

    # The text that should be displayed to the user on the consent screen
    consent_screen_text = string

    # The order in which this scope will be displayed in the consent screen
    gui_order           = number

    # include_in_token    = optional(bool)  # Can override per-scope
  })
}
