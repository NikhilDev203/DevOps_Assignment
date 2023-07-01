
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