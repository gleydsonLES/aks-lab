terraform {
  backend "azurerm" {
    resource_group_name  = "storagegleydson"
    storage_account_name = "tfstategleydson"
    container_name       = "tfstate"
    key                  = "terraform-aks.tfstate"
  }
}