terraform {
  backend "azurerm" {
    resource_group_name  = "aks"
    storage_account_name = "demoakssa"
    container_name       = "demoaksstatefile"
    key                  = "demo-aks.tfstate"

    use_azuread_auth = true
    use_cli          = true
  }
}