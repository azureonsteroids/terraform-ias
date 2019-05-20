resource "azurerm_container_registry" "mug-acr" {
  name                     = "mugacr"
  resource_group_name      = "${azurerm_resource_group.mug-rg-infra.name}"
  location                 = "${var.location}"
  sku                      = "Standard"
  admin_enabled            = false
}