terraform {
  backend "azurerm" {
    storage_account_name = "mugsatfstate"
    container_name       = "mugsctfstate"
    key                  = "mug.terraform.tfstate"
    access_key  = "VtU6hV3IR0E2S9+03n+e6S53eUJluTZgmAPyfgUqzC1wL4xZyyziNky89rLF0bOww+SylqXd4U8Kta/cSQbcjQ=="
  }
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.24.0"

  subscription_id = "944cd0e5-9299-4ced-b6e9-d268b6259538"
  client_id       = "f190bd98-0a24-4aef-a32b-e678f9814995"
  client_secret   = "a1c5fe7c-9975-4e48-bc3a-2b4550251c47"
  tenant_id       = "8a8db036-ee69-4176-aeea-bd82b7bcb7ed"
}
