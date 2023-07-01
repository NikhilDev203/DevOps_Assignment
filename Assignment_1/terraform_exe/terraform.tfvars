#RG
resource_group_variables = {
  "resource_group_1" = {
    resource_group_name     = "rg-web-eastus-dev-01" 
    resource_group_location = "eastus"            
    resource_group_tags = {
      Created_By = "Nikhil",
      Department = "DevOps"
    }
  }
}

#Vnet
virtual_network_variables = {
  "virtual_network_1" = {
    virtual_network_name                = "vnet-web-eastus-dev-01" 
    virtual_network_location            = "eastus"               
    virtual_network_resource_group_name = "rg-web-eastus-dev-01"   
    virtual_network_address_space       = ["255.255.255.0/26"]        
    virtual_network_subnet = [                                   
      {
        virtual_network_subnet_name                                       = "snet-app-eastus-dev-01" 
        virtual_network_subnet_address_prefix                             = "255.255.255.0/28"          
      },
            {
        virtual_network_subnet_name                                       = "snet-db-eastus-dev-01" 
        virtual_network_subnet_address_prefix                             = "255.255.255.16/28"          
      },
            {
        virtual_network_subnet_name                                       = "snet-common-eastus-dev-01" 
        virtual_network_subnet_address_prefix                             = "255.255.255.32/28"          
      }
    ]
    virtual_network_tags = {
      Created_By = "Nikhil",
      Department = "DevOps"
    }
  }
}



#ASP
app_service_plan_variables = {
  "app_service_plan_1" = {
    app_service_plan_name                = "asp-web-eastus-dev-01" 
    app_service_plan_location            = "eastus"              
    app_service_plan_os_type             = "Windows"               
    app_service_plan_resource_group_name = "rg-web-eastus-dev-01"   
    app_service_plan_sku_name            = "B1"                   
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    key_vault_name                                  = "kv-web-eastus-dev-01"                                                                                                                                                                            
    key_vault_location                              = "eastus"                                                                                                                                                                                        
    key_vault_resource_group_name                   = "rg-web-eastus-dev-01"                                                                                                                                                                          
    key_vault_enabled_for_disk_encryption           = true                                                                                                                                                                                          
    key_vault_soft_delete_retention_days            = "7"                                                                                                                                                                                             
    key_vault_purge_protection_enabled              = false                                                                                                                                                                                           
    key_vault_sku_name                              = "standard"                                                                                                                                                                                                                                                                                                                                                                           #(Optional) The object ID of an Application in Azure Active Directory.                                                                                                                                                                        
    key_vault_public_network_access_enabled         = true                                                                                                                                                                                            
  }
}

windows_web_app_variables = {
     "windows_web_app_1" = {
      windows_web_app_name                =    "as-web-eastus-dev-01"      
    windows_web_app_location            = "eastus"      
    windows_web_app_resource_group_name = "rg-web-eastus-dev-01"     
    windows_web_app_virtual_network_name           = "vnet-web-eastus-dev-01"  
    windows_web_app_subnet_name                    = "snet-app-eastus-dev-01"  
    windows_web_app_subnet_resource_group_name     = "rg-web-eastus-dev-01" 
    app_service_plan_name                        = "asp-web-eastus-dev-01" 
    app_service_plan_resource_group_name         = "rg-web-eastus-dev-01"  
     }
}

mssql_server_variables = {

  "mssql_server_1" = {
  mssql_server_name                                 = "sql-server-eastus-dev-01"      
    mssql_server_location                             = "eastus"      
    mssql_server_resource_group_name                  = "rg-web-eastus-dev-01"       
    mssql_server_version                              = "12.0"      
    mssql_server_administrator_login                  = "mradministrator"      
    key_vault_name                                    = "kv-web-eastus-dev-01" 
    admin_password_key_vault_secret_name               = "sql-server-eastus-dev-01-key"         
    mssql_server_minimum_tls_version                  = "1.2"          
  }
}


#MSSQL Database
mssql_database_variables = {
  "mssql_database_1" = {
    mssql_database_name                                 = "sql-db-eastus-dev-01" 
    mssql_database_collation                            = "SQL_Latin1_General_CP1_CI_AS"                    
    mssql_database_license_type                         = "LicenseIncluded"       
    mssql_database_max_size_gb                          = 1                    
    mssql_database_sku_name                             = "S0"                 
    mssql_database_zone_redundant                       = false                   
    mssql_database_mssql_server_name                    = "sql-server-eastus-dev-01"   
    mssql_database_mssql_server_resource_group_name     = "rg-web-eastus-dev-01"
  }
}