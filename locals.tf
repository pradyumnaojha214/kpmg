data "azurerm_resource_group" "rg1" {
  name = "rg1-app"
}

locals {
    resource_obj = {
    name     = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    id       = azurerm_resource_group.rg1.id
  }

  vnet_cidr = ["10.0.1.0/24"]

  tags = "test"
  }
