terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "backendsa101"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
