provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "AKS-LAB"
  location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "lab-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-cert"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "lab"
  }
}