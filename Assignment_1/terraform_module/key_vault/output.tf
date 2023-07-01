output "key_vault_output" {
  value = { for k, v in azurerm_key_vault.keyvault : k => {
    id        = v.id
    }
  }
}
