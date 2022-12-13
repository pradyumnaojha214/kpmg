module app-vnet{
    source                    = "./network/vnet"
    name                = var.name
    address_space       = [var.vnet_cidr]
    location            = local.resource_obj.location
    resource_group_name = local.resource_obj.resource_group_name
    tags                = local.tags
}