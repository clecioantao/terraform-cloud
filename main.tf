# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "4.4.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}


# }

//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "hcpteste" {
  name     = "hcpteste"
  location = "North Europe"
}

// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "hcpteste690201" {
  name                     = "hcpteste690201"
  resource_group_name      = azurerm_resource_group.hcpteste.name
  location                 = azurerm_resource_group.hcpteste.location
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_app_service_plan" "app_hcpteste" {
  name                = "app_hcpteste"
  location            = azurerm_resource_group.hcpteste.location
  resource_group_name = azurerm_resource_group.hcpteste.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}