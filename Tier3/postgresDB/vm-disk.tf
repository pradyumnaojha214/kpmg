resource "azurerm_managed_disk" "this" { ## block for disk for VM
  name                 = "${var.name}-vm-disk"//"acctestmd2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.Storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {   ## block for attaching disk to VM
  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = azurerm_linux_virtual_machine.this.id
  lun                = var.lun
  caching            = var.caching
}