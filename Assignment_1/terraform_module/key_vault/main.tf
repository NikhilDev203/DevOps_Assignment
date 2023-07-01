data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "keyvault" {
  for_each                        = var.key_vault_variables
  name                            = each.value.key_vault_name
  location                        = each.value.key_vault_location
  resource_group_name             = each.value.key_vault_resource_group_name
  enabled_for_disk_encryption     = each.value.key_vault_enabled_for_disk_encryption
  public_network_access_enabled   = each.value.key_vault_public_network_access_enabled
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = each.value.key_vault_soft_delete_retention_days
  purge_protection_enabled        = each.value.key_vault_purge_protection_enabled
  sku_name                        = each.value.key_vault_sku_name
}
