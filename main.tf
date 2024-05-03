terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }   
  }

   cloud {
      organization = "mashcorp"
      workspaces {
        name = "remotestate"        
      }
    }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "1-de8cc746-playground-sandbox"
  location = "South Central US"
}

resource "azurerm_storage_account" "storage" {
  resource_group_name      = azurerm_resource_group.rg.name
  name                     = "strgaccountmashacg"
  location                 = azurerm_resource_group.rg.location
  account_replication_type = "RAGRS"
  account_tier             = "Standard"

}
