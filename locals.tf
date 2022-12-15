# data "azurerm_resource_group" "rg1" {
#   name = "rg1-app"
#   depends_on = resource.azurerm_resource_group.rg1
# }

data "azurerm_resource_group" "rg_demo" {
  name     = "rg_demo"
  
}


data "azurerm_virtual_network" "this" {
  name                = "vnet-app"
  resource_group_name = "rg_demo"
  depends_on = [
      module.app-vnet
    ]
}

data "azurerm_subnet" "this" {
  name                = "subnet-app"
  virtual_network_name = "vnet-app"
  resource_group_name = "rg1-app"
  depends_on = [module.app-subnet]
}

data "azurerm_network_interface" "this" {
  name                = "web-vm-nic"
  resource_group_name = "rg_demo"
  depends_on = [
      module.vm-linux
    ]
}

locals {
    resource_obj = {
    name     = data.azurerm_resource_group.rg_demo.name
    location = data.azurerm_resource_group.rg_demo.location
    id       = data.azurerm_resource_group.rg_demo.id
  }

  address_space = "10.1.1.0/25"
  address_prefixes = "10.1.1.128/26"
  allocation_method = "Static"
  sku = "Standard"
  protocol = "Tcp"
  charset             = "UTF8"
  collation           = "English_United States.1252"
  subnet_id = data.azurerm_subnet.this.id
  size = "Standard_F2"
  admin_username = "admin"
  Storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = "1"
  lun = "10"
  caching = "ReadWrite"
  private_ip_address_allocation = "Dynamic"
  tags = "test"
  virtual_network_id      = data.azurerm_virtual_network.this.id 
  ip_address = data.azurerm_network_interface.this.private_ip_address

  }
