# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.68"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  subscription_id = "f02440d0-0974-4c31-af2f-fd570f6d1fb7"
}

resource "azurerm_resource_group" "rg" {
  name = "TerraformResourceGroup"
  location = "eastus"
}
