variable "name" {
    description = "Name of resource"
    type = string
}

variable "location" {
    description = "location of resource"
    type = string    
}

variable "allocation_method" {
    description = "allocation_method of resource"
    type = string    
}

variable "sku" {
    description = "sku of lb"
    type = string    
}

variable "resource_group_name" {
    description = "resource group name for resource."
    type = string    
}

variable "protocol" {
    description = "protocol for out bound"
    type = string    
}

variable "virtual_network_id" {
    description = "virtual_network_id for azurerm_lb_backend_address_pool_address"
    type = string    
}

variable "ip_address" {
    description = "ip_address for azurerm_lb_backend_address_pool_address"
    type = string    
}