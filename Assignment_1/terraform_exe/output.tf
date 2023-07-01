#RG
output "resource_group_output" {
  value       = module.resource_group.resource_group_output
  description = "resource group output values"
}


#vnet
output "virtual_network_output" {
  value       = module.virtual_network.virtual_network_output
  description = "The virtual network output values"
}


#windows webapp output
output "windows_web_app_output" {
  value       = module.windows_web_app.windows_web_app_output
  description = "Windows Web App Output Values"
}

