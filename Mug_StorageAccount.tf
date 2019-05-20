resource "azurerm_storage_account" "mug-sa-tfstate" {
    name                     = "mugsatfstate"
    resource_group_name      = "${azurerm_resource_group.mug-rg-config.name}"
    location                 = "${var.location}"
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

resource "azurerm_storage_account" "mug-sa-data" {
    name                     = "mugsadata"
    resource_group_name      = "${azurerm_resource_group.mug-rg-prd.name}"
    location                 = "${var.location}"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "mug-data"
    }
}

## prd

resource "azurerm_storage_share" "mug-fs-mongo-prd" {
  name = "mugfsmongo-prd"

  resource_group_name  = "${azurerm_resource_group.mug-rg-prd.name}"
  storage_account_name = "${azurerm_storage_account.mug-sa-data.name}"

  quota = 2
}

resource "azurerm_storage_share" "mug-fs-mongo-dev" {
  name = "mugfsmongo-dev"

  resource_group_name  = "${azurerm_resource_group.mug-rg-prd.name}"
  storage_account_name = "${azurerm_storage_account.mug-sa-data.name}"

  quota = 2
}