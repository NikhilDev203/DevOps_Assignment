#Vnet
resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.virtual_network_variables
  name                = each.value.virtual_network_name
  location            = each.value.virtual_network_location
  resource_group_name = each.value.virtual_network_resource_group_name
  address_space       = each.value.virtual_network_address_space
  dynamic "subnet" {
    for_each = each.value.virtual_network_subnet != null ? toset(each.value.virtual_network_subnet) : []
    content {
      name           = subnet.value.virtual_network_subnet_name
      address_prefix = subnet.value.virtual_network_subnet_address_prefix
      # security_group = subnet.value.virtual_network_subnet_network_security_group_name != null 
    }
  }
  tags = merge(each.value.virtual_network_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}