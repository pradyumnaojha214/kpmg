resource "azurerm_private_endpoint" "this" {
  for_each            = var.private_endpoints
  name                = module.penp_labels.ids_with_suffix[format("%s-%s", var.name, each.key)].pendp
  location            = azurerm_postgresql_server.this.location
  resource_group_name = var.resource_group_name
  subnet_id           = each.value.subnet_id

  private_dns_zone_group {
    name                 = module.penp_labels.id
    private_dns_zone_ids = [each.value.private_dns_zone_id]
  }

  private_service_connection {
    name                           = module.penp_labels.ids_with_suffix[format("%s-%s", var.name, each.key)].pendp
    private_connection_resource_id = azurerm_postgresql_server.this.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = each.value.is_manual_connection
  }

  tags = module.penp_labels.tags
}