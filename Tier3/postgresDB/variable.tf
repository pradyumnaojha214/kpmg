variable "subnet_id" {
    description = "subnet_id of db"
    type = string    
}

variable "resource_group_name" {
    description = "resource group name for resource."
    type = string    
}

variable "location" {
    description = "location of resource"
    type = string    
}

variable "name" {
    description = "Name of resource"
    type = string
}

variable "private_ip_address_allocation" {
    description = "private_ip_address_allocation of resource"
    type = string
}

variable "size" {
    description = "Name of resource"
    type = string
}

variable "admin_username" {
    description = "admin_username of resource"
    type = string
}


variable "storage_account_type" {
    description = "storage_account_type of resource"
    type = string
}

variable "publisher" {
    description = "publisher of resource"
    type = string
}

variable "offer" {
    description = "offer of resource"
    type = string
}

variable "sku" {
    description = "sku of resource"
    type = string
}

variable "Version" {
    description = "Version of resource"
    type = string
}

variable "create_option" {
    description = "create_option of resource"
    type = string
}

variable "disk_size_gb" {
    description = "disk_size_gb of resource"
    type = string
}

variable "lun" {
    description = "lun of resource"
    type = string
}

variable "caching" {
    description = "caching of resource"
    type = string
}

variable "Storage_account_type" {
    description = "Storage_account_type of resource"
    type = string
}
