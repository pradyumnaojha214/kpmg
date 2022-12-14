resource "azurerm_managed_disk" "this" {
  name                 = "${var.name}-vm-disk"//"acctestmd2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.Storage_account_type//"Standard_LRS"
  create_option        = var.create_option//"Copy"
  disk_size_gb         = var.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = azurerm_linux_virtual_machine.this.id
  lun                = var.lun//"10"
  caching            = var.caching//"ReadWrite"
}