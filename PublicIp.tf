resource "azurerm_public_ip" "mug-public-ip" {
  name                         = "mug-public-ip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.mug-rg-infra.name}"
  public_ip_address_allocation = "dynamic"
  sku			       = "basic"
  domain_name_label = "muginclermont"


  tags {
     environment = "mug-public-ip"
  }	
}

resource "azurerm_public_ip" "mug-public-ip-vnet-gtw" {
  name                         = "mug-public-ip-vnet-gtw"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.mug-rg-infra.name}"
  public_ip_address_allocation = "dynamic"
  sku			       = "basic"
  domain_name_label            = "muginclermont-vnet-gtw"

  tags {
     environment = "VPN Gateway"
  }	
}