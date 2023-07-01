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