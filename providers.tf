
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate07"
    storage_account_name = "newsabetfstatevpmba2"
    container_name       = "new-tfstate07"
    key                  = "newterraform.tfstate-07"
  }
}
