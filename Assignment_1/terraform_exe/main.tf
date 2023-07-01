#RESOURCE GROUP
module "resource_group" {
  source                   = "../terraform_module/resource_group"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "virtual_network" {
  source                    = "../terraform_module/virtual_network"
  virtual_network_variables = var.virtual_network_variables
  depends_on                =  [module.resource_group]
}

#ASP
module "app_service_plan" {
  source                     = "../terraform_module/app_service_plan"
  app_service_plan_variables = var.app_service_plan_variables
  depends_on                 = [module.resource_group]
}

#KV
module "key_vault" {
  source              = "../terraform_module/key_vault"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}


#web app
module "windows_web_app" {
  source                  = "../terraform_module/web_app"
  windows_web_app_variables = var.windows_web_app_variables
  depends_on              = [module.virtual_network, module.app_service_plan]
}



# MSSQL SERVER
module "mssql_server" {
  source                 = "../terraform_module/mssql_server"
  mssql_server_variables = var.mssql_server_variables
  depends_on             = [module.resource_group]
}

# MSSQL DATABASE
module "mssql_database" {
  source                   = "../terraform_module/mssql_database"
  mssql_database_variables = var.mssql_database_variables
  depends_on               = [module.mssql_server]
}


