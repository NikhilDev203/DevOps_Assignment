#Generate random password
resource "random_password" "password" {
  for_each    = var.mssql_server_variables
  length      = 12
  special     = true
  lower       = true
  upper       = true
  numeric     = true
  min_lower   = 4
  min_upper   = 4
  min_numeric = 2
  min_special = 2
}

data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.mssql_server_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.mssql_server_resource_group_name
}

resource "azurerm_key_vault_secret" "generated_password_key_vault_secret" {
  for_each     = var.mssql_server_variables
  name         = each.value.admin_password_key_vault_secret_name
  value        = random_password.password[each.key].result
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}

resource "azurerm_mssql_server" "mssql_server" {
  for_each                             = var.mssql_server_variables
  name                                 = each.value.mssql_server_name
  resource_group_name                  = each.value.mssql_server_resource_group_name
  location                             = each.value.mssql_server_location
  version                              = each.value.mssql_server_version
  administrator_login                  = each.value.mssql_server_administrator_login
  administrator_login_password         = azurerm_key_vault_secret.generated_password_key_vault_secret[each.key].value
  minimum_tls_version                  = each.value.mssql_server_minimum_tls_version
}