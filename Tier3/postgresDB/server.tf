resource "azurerm_postgresql_server" "this" {
  name                             = var.name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  administrator_login              = var.pgsql_root_login_name
  administrator_login_password     = var.administrator_login_password
  sku_name                         = var.sql_sku
  version                          = var.sql_version
  backup_retention_days            = 7
  geo_redundant_backup_enabled     = true
  auto_grow_enabled                = true
  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.minimal_tls_version
  tags                             = var.tags
  storage_mb                       = var.storage_mb
}