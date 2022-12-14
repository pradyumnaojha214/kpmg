data "azurerm_resource_group" "rg1" {
  name = "rg1-app"
}

data "azurerm_subnet" "this" {
  name                = "subnet-app"
  virtual_network_name = "vnet-app"
  resource_group_name = "rg1-app"
  depends_on = [module.app-subnet]
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
  charset             = "UTF8"
  collation           = "English_United States.1252"
  subnet_id = data.azurerm_subnet.this.id


  tags = "test"
  }
