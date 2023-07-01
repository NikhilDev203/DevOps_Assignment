#RG Var
variable "resource_group_variables" {
  type = map(object({
    resource_group_name     = string      
    resource_group_location = string     
    resource_group_tags     = map(string) 
  }))
}
