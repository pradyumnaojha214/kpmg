resource "azurerm_postgresql_database" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.this.name
  charset             = var.charset
  collation           = var.collation
  
}