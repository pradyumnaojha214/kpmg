
module lb-test {
    source              = "./Tier1/loadBalancer"
    name = "test"
    location = local.resource_obj.location
    allocation_method = local.allocation_method
    sku = local.sku
    protocol = local.protocol
    resource_group_name = local.resource_obj.name
    virtual_network_id      = local.virtual_network_id 
    ip_address = local.ip_address
    depends_on = [
      module.vm-linux
    ]
}