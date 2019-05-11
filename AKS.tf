
resource "azurerm_kubernetes_cluster" "mug-k8s-testing" {

  name                    = "${var.k8s-testing["name"]}"
  location                = "${var.location}"
  dns_prefix              = "${var.k8s-testing["dns_prefix"]}"
  resource_group_name     = "${var.k8s-testing["resource_group"]}"
  kubernetes_version      = "${var.k8s-testing["kubernetes_version"]}"

  agent_pool_profile {
      name                = "agentpool"
      count               = 2
      vm_size             = "Standard_B2s"
      os_type             = "Linux"

      vnet_subnet_id      = "${azurerm_subnet.mug-subnet-k8s-testing.id}"
  }

  service_principal {
      client_id           = "${var.aks_service_principal["client_id"]}"
      client_secret       = "${var.aks_service_principal["client_secret"]}"
  }

  tags {
      environment = "testing"
  }

  network_profile {
    network_plugin        = "${var.k8s-testing["network_plugin"]}"
    service_cidr          = "${var.k8s-testing["service_cidr"]}"
    dns_service_ip        = "${var.k8s-testing["dns_service_ip"]}" 
    docker_bridge_cidr    = "${var.k8s-testing["docker_bridge_cidr"]}"
  }

}