resource "azurerm_linux_virtual_machine" "this" { ## block for creating Linux VM
  name                = "${var.name}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size 
  admin_username      = var.admin_username
  disable_password_authentication = false
  admin_password = "Test@214"
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  

  os_disk {
    caching              = var.caching 
    storage_account_type = var.storage_account_type 
  }

  source_image_reference {
    publisher = var.publisher 
    offer     = var.offer
    sku       = var.sku 
    version   = var.Version 
  }
}