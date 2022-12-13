variable "name" {
    description = "name of Vnet."
    type = string    
}

variable "location" {
    description = "location of resource"
    type = string    
}

variable "resource_group_name" {
    description = "resource group name for resource."
    type = string    
}

variable "vnet_cidr" {
    description = "A valid CIDR."
    type = string    
}

variable "tags" {
    description = "tags for resource."
    type = string    
}