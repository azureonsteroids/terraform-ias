# resource "azurerm_virtual_network" "mug-vnet-k8s-backup" {
#   name                = "mug-vnet-k8s-backup"
#   address_space       = ["10.61.12.0/22"]
#   location            = "${var.location}"
#   resource_group_name = "${azurerm_resource_group.mug-rg-backup.name}"
# }

# resource "azurerm_subnet" "mug-subnet-k8s-backup" {
#   name                 = "mug-subnet-k8s-backup"
#   resource_group_name  = "${azurerm_resource_group.mug-rg-backup.name}"
#   virtual_network_name = "${azurerm_virtual_network.mug-vnet-k8s-backup.name}"
#   address_prefix       = "10.61.14.0/23"
#   service_endpoints    = ["Microsoft.Storage"]
# }