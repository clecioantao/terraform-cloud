terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
  features {}


}

//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "hcp-teste" {
  name     = "hcp-teste"
  location = "North Europe"
}

// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "hcpteste690201" {
  name                     = "hcpteste690201"
  resource_group_name      = azurerm_resource_group.hcp-teste.name
  location                 = azurerm_resource_group.hcp-teste.location
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}