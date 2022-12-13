data "azurerm_resource_group" "rg1" {
  name = "rg1-app"
}

resource "azurerm_virtual_network" "envVnet" {
  name                = var.name
  address_space       = [var.vnet_cidr]
  location            = data.azurerm_resource_group.rg1.location
  resource_group_name = local.resource_group
  tags = var.tags
}