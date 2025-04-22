terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}
  # Configure the Azure provider with the desired region    
  subscription_id = "fb85801b-367a-4ef8-8b37-eaf7a1f71813"
  
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
