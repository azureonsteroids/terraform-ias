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