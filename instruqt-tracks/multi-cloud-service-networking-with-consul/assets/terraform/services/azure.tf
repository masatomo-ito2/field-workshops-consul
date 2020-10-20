resource "azurerm_postgresql_server" "postgres" {
  name                = "psqlserver"
  location            = data.terraform_remote_state.infra.outputs.azure_rg_location
  resource_group_name = data.terraform_remote_state.infra.outputs.azure_rg_name

  administrator_login          = "postgres"
  administrator_login_password = "postgres"

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 640000

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}