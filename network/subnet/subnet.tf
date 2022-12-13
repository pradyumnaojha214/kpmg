resource "azurerm_subnet" "envSubnets" {
  //for_each = zipmap(local.subnet_names, cidrsubnets(data.azurerm_virtual_network.srcVnet.address_space[0], 2, 2, 2))
  name = var.name
  resource_group_name  = var.vnet_resource_group
  virtual_network_name = var.vnet_name
  address_prefixes = [var.snet_cidr]
  service_endpoints  = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.ContainerRegistry",
    "Microsoft.KeyVault",
    "Microsoft.Storage",
    "Microsoft.Sql"
  ]
}