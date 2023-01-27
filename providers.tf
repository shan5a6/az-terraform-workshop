terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }

    backend "azurerm" {
        resource_group_name  = "terraform-rg" # Resource Group Name
        storage_account_name = "dvsterraformiac" # Storage Account Name
        container_name       = "statefilebackup" # Container/Blob Name
        key                  = "default.tfstate" # State File Name
    }
}

provider "azurerm" {
  # Configuration options
        features {}
}