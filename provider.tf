terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.2"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=1.6.0"
    }
  }
}

provider "azurerm" {
  environment     = "public"
  subscription_id = "0eecd42f-75eb-433a-9cb6-fa4155ea89aa"
  tenant_id       = "33440fc6-b7c7-412c-bb73-0e70b0198d5a"
  
  features {}
}
