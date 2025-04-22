variable "sa_name" {}
variable "container_name" {}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_name  = var.sa_name
  container_access_type = "container"
}




