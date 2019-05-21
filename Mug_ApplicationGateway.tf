resource "azurerm_application_gateway" "mug-ag" {
  name                = "${var.application_gateway}"
  resource_group_name = "${azurerm_resource_group.mug-rg-infra.name}"
  location            = "${var.location}"

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${var.application_gateway}-ip-configuration"
    subnet_id = "${azurerm_virtual_network.mug-subnet-infra.id}/subnets/${azurerm_subnet.mug-infra-front.name}"
  }

  frontend_port {
    name = "${var.application_gateway}-feport"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${var.application_gateway}-feip"
    public_ip_address_id = "${azurerm_public_ip.mug-public-ip.id}"
  }

  ## MAIN
  backend_address_pool {
    name = "backendPoolIngress-mug"
    ip_address_list = ["10.51.14.66"]
  }

  backend_http_settings {
    name                  = "HTTPSettingIngress-mug"
    cookie_based_affinity = "Enabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "listerIngress-mug"
    host_name                      = "muginclermont.trafficmanager.net"
    frontend_ip_configuration_name = "${var.application_gateway}-feip"
    frontend_port_name             = "${var.application_gateway}-feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "ruleIngress-mug"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "listerIngress-mug"
    url_path_map_name          = "urlPathMap-mug"
  }

  url_path_map {
    name      = "urlPathMap-mug"
    default_backend_address_pool_name  = "backendPoolIngress-mug"
    default_backend_http_settings_name  = "HTTPSettingIngress-mug"

    path_rule {
      name = "pathRule-mug-dev"
      paths = ["/dev/*"]
      backend_address_pool_name = "backendPoolIngress-mug-dev"
      backend_http_settings_name  = "HTTPSettingIngress-mug-dev"
    }

  }

  # DEV 

  backend_address_pool {
    name = "backendPoolIngress-mug-dev"
    ip_address_list = ["10.51.14.67"]
  }

  backend_http_settings {
    name                  = "HTTPSettingIngress-mug-dev"
    cookie_based_affinity = "Enabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

}
