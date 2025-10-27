
resource "keycloak_realm" "psp_realm" {
  realm = "psp"
  enabled = true
  display_name = "PSP realm"
}
