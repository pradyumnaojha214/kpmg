data "azurerm_resource_group" "rg1" {
  name = "rg1-app"
}

locals {
    resource_obj = {
    name     = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    id       = azurerm_resource_group.rg1.id
  }

  address_space = "10.1.1.0/25"
  address_prefixes = "10.1.1.130/26"
  allocation_method = "Static"
  sku = "Standard"
  protocol = "Tcp"


  tags = "test"
  }
