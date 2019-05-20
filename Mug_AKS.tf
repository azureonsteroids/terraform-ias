
resource "azurerm_kubernetes_cluster" "mug-k8s-prd" {

  name                    = "${var.k8s-prd["name"]}"
  location                = "${var.location}"
  dns_prefix              = "${var.k8s-prd["dns_prefix"]}"
  resource_group_name     = "${var.k8s-prd["resource_group"]}"
  kubernetes_version      = "${var.k8s-prd["kubernetes_version"]}"

  agent_pool_profile {
      name                = "agentpool"
      count               = 2
      vm_size             = "Standard_B2s"
      os_type             = "Linux"

      vnet_subnet_id      = "${azurerm_subnet.mug-subnet-k8s-prd.id}"
  }

  service_principal {
      client_id           = "${var.aks_service_principal["client_id"]}"
      client_secret       = "${var.aks_service_principal["client_secret"]}"
  }

  tags {
      environment = "prd"
  }

  network_profile {
    network_plugin        = "${var.k8s-prd["network_plugin"]}"
    service_cidr          = "${var.k8s-prd["service_cidr"]}"
    dns_service_ip        = "${var.k8s-prd["dns_service_ip"]}" 
    docker_bridge_cidr    = "${var.k8s-prd["docker_bridge_cidr"]}"
  }

}