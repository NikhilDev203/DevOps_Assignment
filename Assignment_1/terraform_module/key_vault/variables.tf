#KEY VAULT 
variable "key_vault_variables" {
  type = map(object({
    key_vault_name                                  = string       
    key_vault_resource_group_name                   = string       
    key_vault_location                              = string     
    key_vault_public_network_access_enabled         =   bool
    key_vault_enabled_for_disk_encryption           = bool         
    key_vault_soft_delete_retention_days            = string      
    key_vault_purge_protection_enabled              = bool         
    key_vault_sku_name                              = string   
  }))
}