resource "azurerm_resource_group" "mug-rg-config" {
    name = "mug-rg-config"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-testing" {
    name = "mug-rg-testing"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-infra" {
    name = "mug-rg-infra"
    location = "${var.location}"
}
