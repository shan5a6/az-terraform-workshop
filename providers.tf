terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-rg"  # Resourcegroupname
    storage_account_name = "dvsterraformiac" # Storage account name 
    container_name       = "statefilebackup" # Container/blob name
    key                  = "default.tfstate" # state file name 
  }

}
provider "azurerm" {
  # Configuration options
  features {}
}
