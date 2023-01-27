terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "dvsterraformiac"
    container_name       = "statefilebackup"
    key                  = "default.tfstate"
  }

}
provider "azurerm" {
  # Configuration options
  features {}
}
