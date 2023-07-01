#ASP
variable "app_service_plan_variables" {
  type = map(object({
    app_service_plan_name                = string      
    app_service_plan_location            = string      
    app_service_plan_os_type             = string      
    app_service_plan_resource_group_name = string      
    app_service_plan_sku_name            = string 
  }))
}