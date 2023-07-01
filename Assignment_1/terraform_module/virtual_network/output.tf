output "virtual_network_output" {
  description = "The virtual network output values"
  value = { for k, v in azurerm_virtual_network.virtual_network : k => {
    id                            = v.id
    virtual_network_address_space = v.address_space
    subnet                        = v.subnet
    }
  }
}