resource "azurerm_servicebus_namespace" "mug-servicebus-namespace" {
  name                = "mug-servicebus-namespace"
  location            = "${azurerm_resource_group.mug-rg-infra.location}"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "mug-goodies-order" {
  name                = "mug-goodies-order"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
  namespace_name      = "${azurerm_servicebus_namespace.mug-servicebus-namespace.name}"

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "mug-event-register" {
  name                = "mug-events-register"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
  namespace_name      = "${azurerm_servicebus_namespace.mug-servicebus-namespace.name}"

  enable_partitioning = true
}