terraform{
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
 # backend "azurerm" {
    
 # }
}

provider "azurerm" {
  features {}
  subscription_id = "177b7e12-5f03-4f63-bcd1-ed6d1d776bff"

}

variable "rg_name" {}
variable "location" {}
variable "sa_name" {}
variable "container_name" {}

module "rg" {
  source   = "../rg"
  rg_name  = var.rg_name
  location = var.location
}

module "sa" {
  source   = "../sa"
  rg_name  = var.rg_name
  location = var.location
  sa_name  = var.sa_name
  depends_on = [ module.rg ]
}

module "container" {
  source         = "../sc"
  sa_name        = var.sa_name
  container_name = var.container_name
    depends_on = [ module.sa ]
}
