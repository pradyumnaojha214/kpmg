variable "name" {
    description = "Name of resource"
    type = string
}

variable "location" {
    description = "location of resource"
    type = string    
}

variable "charset" {
    description = "charset of db"
    type = string    
}

variable "collation" {
    description = "collation of db"
    type = string    
}

variable "administrator_login" {
    description = "administrator_login of db"
    type = string    
}

variable "administrator_login_password" {
    description = "administrator_login_password of db"
    type = string    
}

variable "sku_name" {
    description = "sku_name of db"
    type = string    
}

variable "version" {
    description = "version of db"
    type = string    
}

variable "backup_retention_days" {
    description = "backup_retention_days of db"
    type = string    
}


variable "geo_redundant_backup_enabled" {
    description = "geo_redundant_backup_enabled of db"
    type = bool    
}

variable "auto_grow_enabled" {
    description = "auto_grow_enabled of db"
    type = bool    
}

variable "public_network_access_enabled" {
    description = "public_network_access_enabled of db"
    type = bool    
}

variable "ssl_enforcement_enabled" {
    description = "ssl_enforcement_enabled of db"
    type = bool    
}

variable "minimal_tls_version" {
    description = "minimal_tls_version of db"
    type = bool    
}

variable "storage_mb" {
    description = "storage_mb of db"
    type = bool    
}
