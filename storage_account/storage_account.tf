provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "storage-account" {
  name     = "storagegleydson"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "tfstategleydson"
  resource_group_name      = azurerm_resource_group.storage-account.name
  location                 = azurerm_resource_group.storage-account.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }

}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "private"
}