resource "azurerm_network_interface" "this" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.name}-nic-ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}