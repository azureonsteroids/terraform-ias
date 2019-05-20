resource "azurerm_traffic_manager_profile" "mug-trmp" {
  name                = "mug-trmp"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"

  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "muginclermont"
    ttl           = "${var.traffic_manager_ttl}"
  }

  monitor_config {
    protocol = "${var.traffic_manager_protocol}"
    port     = "${var.traffic_manager_port}"
    path     = "${var.traffic_manager_path}"
  }

}

resource "azurerm_traffic_manager_endpoint" "mug-trmp-endpoint" {
  name                = "mug-trmp-endpoint"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
  profile_name        = "${azurerm_traffic_manager_profile.mug-trmp.name}"
  target_resource_id  = "${azurerm_public_ip.mug-public-ip.id}"
  type                = "azureEndpoints"
  weight              = 10
}

