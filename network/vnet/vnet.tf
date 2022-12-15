
resource "azurerm_virtual_network" "envVnet" { ## block for creating vnet
  name                = var.name
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
  
}