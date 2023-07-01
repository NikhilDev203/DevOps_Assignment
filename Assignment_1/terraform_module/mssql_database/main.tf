data "azurerm_mssql_server" "mssql_server" {
  for_each            = var.mssql_database_variables
  name                = each.value.mssql_database_mssql_server_name
  resource_group_name = each.value.mssql_database_mssql_server_resource_group_name
}

# MSSQL Database
resource "azurerm_mssql_database" "mssql_database" {
  for_each                    = var.mssql_database_variables
  name                        = each.value.mssql_database_name
  server_id                   = data.azurerm_mssql_server.mssql_server[each.key].id
  collation                   = each.value.mssql_database_collation
  license_type                = each.value.mssql_database_license_type
  max_size_gb                 = each.value.mssql_database_max_size_gb
  sku_name                    = each.value.mssql_database_sku_name
  zone_redundant              = each.value.mssql_database_zone_redundant
}