module postgre-db{
    source              = "./Tier3/postgresDB"
    name = "postgres"
    location = local.resource_obj.location
    resource_group_name = local.resource_obj.name
    administrator_login = "Adam"
    administrator_login_password = "keep-secret-through-keyvault@214"
    sku_name = "GP_Gen5_4"
    Version = "11"
    backup_retention_days = "7"
    geo_redundant_backup_enabled = false
    auto_grow_enabled = false
    public_network_access_enabled = false
    ssl_enforcement_enabled = true
    ssl_minimal_tls_version_enforced = "TLS1_2"
    storage_mb = 640000
    charset = local.charset
    collation = local.collation
    subnet_id= local.subnet_id
}