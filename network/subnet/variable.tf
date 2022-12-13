variable "vnet_name" {
    description = "Name of target VNET for subnets being added."
    type = string
}

variable "vnet_resource_group" {
    description = "Resource group of target VNET for subnets being added."
    type = string
}

variable "name" {
    description = "subnet name."
    type = string
}

variable "snet_cidr" {
    description = "A valid CIDR for subnet"
    type = string
}