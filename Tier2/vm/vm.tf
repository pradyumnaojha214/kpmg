resource "azurerm_linux_virtual_machine" "this" {
  name                = "${var.name}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size //"Standard_F2"
  admin_username      = var.admin_username//"adminuser"
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.caching //"ReadWrite"
    storage_account_type = var.storage_account_type //"Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher //"Canonical"
    offer     = var.offer//"UbuntuServer"
    sku       = var.sku //"16.04-LTS"
    version   = var.Version //"latest"
  }
}