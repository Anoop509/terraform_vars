variable "sa_name" {}
variable "location" {}
variable "rg_name" {}



resource "azurerm_storage_account" "this" {
  name                     = var.sa_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
