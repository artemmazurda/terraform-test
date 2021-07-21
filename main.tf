# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.68"
    }
  }
  required_version = ">= 0.14.9"

  backend "remote" {
    organization = "test-migration"
    workspaces {
      name = "test-migration-workspace"
    }
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}Test"
  location = "eastus"
  tags = {
    Environment = "Terraform"
    Team = "Dev"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name = "TerraformVirtualNetwork"
  location = "eastus"
  address_space = [ "10.0.0.0/16" ]
  resource_group_name = azurerm_resource_group.rg.name
}
