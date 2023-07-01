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
    # virtual_network_subnet_network_security_group_name                = string 
      # virtual_network_subnet_network_security_group_resource_group_name = string 
    }))
    virtual_network_tags = map(string)
  }))
}
