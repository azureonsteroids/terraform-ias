# terraform {
#   backend "azurerm" {
#     storage_account_name = "mugsatfstate"
#     container_name       = "mugsctfstate"
#     key                  = "mug.terraform.tfstate"
#     access_key  = "quV16Ctx7iBNNr5KbVaLs5aFDCA1uaw0m49J9XPgN2dyd7N6lwa7eXO5WJZ2MaNobYGCeSMf5F+epg4rF1ktMw=="
#   }
# }

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.24.0"

  subscription_id = "944cd0e5-9299-4ced-b6e9-d268b6259538"
  client_id       = "f190bd98-0a24-4aef-a32b-e678f9814995"
  client_secret   = "a1c5fe7c-9975-4e48-bc3a-2b4550251c47"
  tenant_id       = "8a8db036-ee69-4176-aeea-bd82b7bcb7ed"
}

