resource "azurerm_virtual_network" "mug-vnet-k8s-testing" {
  name                = "mug-vnet-k8s-testing"
  address_space       = ["10.51.12.0/22"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.mug-rg-testing.name}"
}

resource "azurerm_subnet" "mug-subnet-k8s-testing" {
  name                 = "mug-subnet-k8s-testing"
  resource_group_name  = "${azurerm_resource_group.mug-rg-testing.name}"
  virtual_network_name = "${azurerm_virtual_network.mug-vnet-k8s-testing.name}"
  address_prefix       = "10.51.14.0/23"
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_virtual_network" "mug-subnet-infra" {
  name                = "mug-subnet-infra"
  address_space       = ["10.51.40.0/24"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
}

resource "azurerm_subnet" "mug-gateway-subnet" {
  name                 = "mug-gateway-subnet"
  resource_group_name  = "${azurerm_resource_group.mug-rg-infra.name}"
  virtual_network_name = "${azurerm_virtual_network.mug-subnet-infra.name}"
  address_prefix       = "10.51.40.32/27"
}

resource "azurerm_subnet" "mug-infra-front" {
  name                 = "mug-infra-front"
  resource_group_name  = "${azurerm_resource_group.mug-rg-infra.name}"
  virtual_network_name = "${azurerm_virtual_network.mug-subnet-infra.name}"
  address_prefix       = "10.51.40.64/27"
  network_security_group_id = "${azurerm_network_security_group.mug-sg-front.id}"
}

resource "azurerm_network_security_group" "mug-sg-front" {
  name     = "mug-sg-front"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"

  security_rule {
    name                       = "HTTP"
    priority                   = 3050
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
