locals {
    os_disk = {
      caching              = "ReadWrite"
       storage_account_type = "StandardSSD_LRS"
     }
    source_image_reference = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


module vm-linux{
    source              = "./Tier2/vm"
    name = "web-vm"
    resource_group_name = local.resource_obj.name
    location = local.resource_obj.location
    size = local.size
    admin_username = "admin"
    Storage_account_type = local.Storage_account_type
    create_option = local.create_option
    disk_size_gb = local.disk_size_gb
    lun = local.lun
    caching = local.caching
    source_image_reference = local.source_image_reference
    os_disk = local.os_disk

}