module app-vnet{
    source              = "./network/vnet"
    name                = "vnet-app"
    address_space       = [var.vnet_cidr]
    location            = local.resource_obj.location
    resource_group_name = local.resource_obj.resource_group_name
    tags                = local.tags
}

module app-subnet{
    source               = "./network/subnet"
    name                 = "subnet-app"
    resource_group_name  = local.resource_obj.location
    virtual_network_name = "vnet-app"
    address_prefixes     = [var.snet_cidr]
}