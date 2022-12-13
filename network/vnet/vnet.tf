
resource "azurerm_virtual_network" "envVnet" {
  name                = var.name
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}