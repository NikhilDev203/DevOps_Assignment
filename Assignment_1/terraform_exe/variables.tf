#RG
variable "resource_group_variables" {
  type = map(object({
    resource_group_name     = string      
    resource_group_location = string      
    resource_group_tags     = map(string) 
  }))
}

#VNET 
variable "virtual_network_variables" {
  type = map(object({
    virtual_network_name                = string                                 
    virtual_network_location            = string                                 
    virtual_network_resource_group_name = string                                 
    virtual_network_address_space       = list(string)                                                
    virtual_network_subnet = list(object({                                       
      virtual_network_subnet_name                                       = string 
      virtual_network_subnet_address_prefix                             = string 
    }))
    virtual_network_tags = map(string) 
  }))
}

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

#MSSQL Server
variable "mssql_server_variables" {
  type = map(object({
    mssql_server_name                                 = string      
    mssql_server_location                             = string     
    mssql_server_resource_group_name                  = string     
    mssql_server_version                              = string      
    mssql_server_administrator_login                  = string      
    key_vault_name                                     = string
    admin_password_key_vault_secret_name              = string 
    mssql_server_minimum_tls_version                  = number        
  }))
}



# MSSQL Database
variable "mssql_database_variables" {
  type = map(object({
    mssql_database_name                                 = string   
    mssql_database_collation                            = string    
    mssql_database_license_type                         = string   
    mssql_database_max_size_gb                          = string    
    mssql_database_sku_name                             = string    
    mssql_database_zone_redundant                       = bool      
    mssql_database_mssql_server_name                    = string    
    mssql_database_mssql_server_resource_group_name     = string
  }))
}