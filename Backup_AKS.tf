
# resource "azurerm_kubernetes_cluster" "mug-k8s-backup" {

#   name                    = "${var.k8s-backup["name"]}"
#   location                = "${var.location}"
#   dns_prefix              = "${var.k8s-backup["dns_prefix"]}"
#   resource_group_name     = "${var.k8s-backup["resource_group"]}"
#   kubernetes_version      = "${var.k8s-backup["kubernetes_version"]}"

#   agent_pool_profile {
#       name                = "agentpool"
#       count               = 2
#       vm_size             = "Standard_B2s"
#       os_type             = "Linux"

#       vnet_subnet_id      = "${azurerm_subnet.mug-subnet-k8s-backup.id}"
#   }

#   service_principal {
#       client_id           = "${var.aks_service_principal["client_id"]}"
#       client_secret       = "${var.aks_service_principal["client_secret"]}"
#   }

#   tags {
#       environment = "backup"
#   }

#   network_profile {
#     network_plugin        = "${var.k8s-backup["network_plugin"]}"
#     service_cidr          = "${var.k8s-backup["service_cidr"]}"
#     dns_service_ip        = "${var.k8s-backup["dns_service_ip"]}" 
#     docker_bridge_cidr    = "${var.k8s-backup["docker_bridge_cidr"]}"
#   }

# }