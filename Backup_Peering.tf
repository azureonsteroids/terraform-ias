# resource "azurerm_virtual_network_peering" "aksbackuptoinfra" {
#   name                      = "aksbackuptoinfra"
#   resource_group_name       = "${azurerm_resource_group.mug-rg-backup.name}"
#   virtual_network_name      = "${azurerm_virtual_network.mug-vnet-k8s-backup.name}"
#   remote_virtual_network_id = "${azurerm_virtual_network.mug-subnet-infra.id}"
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = true
# }

# resource "azurerm_virtual_network_peering" "infratoaksbackup" {
#   name                      = "infratoaks"
#   resource_group_name       = "${azurerm_resource_group.mug-rg-infra.name}"
#   virtual_network_name      = "${azurerm_virtual_network.mug-subnet-infra.name}"
#   remote_virtual_network_id = "${azurerm_virtual_network.mug-vnet-k8s-backup.id}"
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = true
# }