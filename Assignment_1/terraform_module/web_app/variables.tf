#web app variables
variable "windows_web_app_variables" {
  type = map(object({
    windows_web_app_name                = string      
    windows_web_app_location            = string     
    windows_web_app_resource_group_name = string     
    windows_web_app_virtual_network_name           = string 
    windows_web_app_subnet_name                    = string 
    windows_web_app_subnet_resource_group_name     = string 
    app_service_plan_name                        = string 
    app_service_plan_resource_group_name         = string 
  }))
}
