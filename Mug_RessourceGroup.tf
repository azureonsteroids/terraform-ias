resource "azurerm_resource_group" "mug-rg-config" {
    name = "mug-rg-config"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-testing" {
    name = "mug-rg-testing"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-prd" {
    name = "mug-rg-prd"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-dev" {
    name = "mug-rg-dev"
    location = "${var.location}"
}

resource "azurerm_resource_group" "mug-rg-infra" {
    name = "mug-rg-infra"
    location = "${var.location}"
}
