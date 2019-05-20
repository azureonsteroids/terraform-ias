resource "azurerm_virtual_network_peering" "akstoinfra" {
  name                      = "akstoinfra"
  resource_group_name       = "${azurerm_resource_group.mug-rg-prd.name}"
  virtual_network_name      = "${azurerm_virtual_network.mug-vnet-k8s-prd.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.mug-subnet-infra.id}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
}

resource "azurerm_virtual_network_peering" "infratoaks" {
  name                      = "infratoaks"
  resource_group_name       = "${azurerm_resource_group.mug-rg-infra.name}"
  virtual_network_name      = "${azurerm_virtual_network.mug-subnet-infra.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.mug-vnet-k8s-prd.id}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
