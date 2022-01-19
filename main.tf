# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  
provider "azurerm" {
 features {}
}

#Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "MarksOrg_Resources"
  location = "uksouth"

  tags = {
    Environment = "MarksOrg-Testing"
	Workspace = "Terraform-IaC-PoC"
	Repository = "GitHub"
  }
}
	
#Define vnet and subnet
resource "azurerm_virtual_network" "MarksOrg-vnet" {
  name                = "MarksOrg-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}
