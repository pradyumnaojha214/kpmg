variable "virtual_network_name" {
    description = "Name of target VNET for subnets being added."
    type = string
}

variable "resource_group_name" {
    description = "Resource group of target VNET for subnets being added."
    type = string
}

variable "name" {
    description = "subnet name."
    type = string
}

variable "address_prefixes" {
    description = "A valid CIDR for subnet"
    type = string
}
