resource "azurerm_storage_account" "mug-sa-tfstate" {
    name                     = "mugsatfstate"
    resource_group_name      = "${azurerm_resource_group.mug-rg-config.name}"
    location                 = "westeurope"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "mug-infra"
    }
}

resource "azurerm_storage_container" "mug-tfstate-container" {
  name                  = "mugsctfstate"
  resource_group_name   = "${azurerm_resource_group.mug-rg-config.name}"
  storage_account_name  = "${azurerm_storage_account.mug-sa-tfstate.name}"
  container_access_type = "private"
}