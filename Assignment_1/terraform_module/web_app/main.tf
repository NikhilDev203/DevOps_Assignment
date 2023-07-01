#data source for subnet
data "azurerm_subnet" "subnet" {
  for_each             = var.windows_web_app_variables
  virtual_network_name = each.value.windows_web_app_virtual_network_name
  name                 = each.value.windows_web_app_subnet_name
  resource_group_name  = each.value.windows_web_app_subnet_resource_group_name
}
#data source for service paln
data "azurerm_service_plan" "app_service_plan" {
  for_each            = var.windows_web_app_variables
  name                = each.value.app_service_plan_name
  resource_group_name = each.value.app_service_plan_resource_group_name
}


#webapp  
resource "azurerm_windows_web_app" "windows_web_app" {
  for_each            = var.windows_web_app_variables
  name                = each.value.windows_web_app_name
  location            = each.value.windows_web_app_location
  resource_group_name = each.value.windows_web_app_resource_group_name
  service_plan_id     = data.azurerm_service_plan.app_service_plan[each.key].id

  site_config {
      always_on              = false 
       application_stack {
 dotnet_version      = "v6.0"
        }
#         ip_restriction {
#   virtual_network_subnet_id = data.azurerm_subnet.subnet[each.key].id
# }
  }
}

data "azurerm_windows_web_app" "windows_web_app" {
  for_each            = var.windows_web_app_variables
  name                = each.value.windows_web_app_name
  resource_group_name = each.value.windows_web_app_resource_group_name
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  for_each            = var.windows_web_app_variables
  app_service_id = data.azurerm_windows_web_app.windows_web_app[each.key].id
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
}