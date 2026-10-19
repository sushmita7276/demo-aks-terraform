
module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  snetaks_subnet_name   = var.snetaks_subnet_name
  snetaks_subnet_prefix = var.snetaks_subnet_prefix

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "aks" {
  source = "./modules/aks"

  aks_name            = var.aks_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  aks_dns_prefix      = var.aks_dns_prefix

  snetaks_subnet_id = module.network.snetaks_subnet_id

  node_count   = var.node_count
  node_vm_size = var.node_vm_size

}

module "acr" {
  source = "./modules/acr"

  acr_name            = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
data "azurerm_client_config" "current" {}

resource "random_password" "app_secret" {
  length  = 48
  special = true
}

module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  terraform_principal_id            = data.azurerm_client_config.current.object_id
  aks_secrets_provider_principal_id = module.aks.key_vault_secrets_provider_identity_object_id

  sql_username = var.sql_admin_username
  sql_password = var.sql_admin_password
  app_secret   = random_password.app_secret.result
}

module "sql" {
  source = "./modules/azure-sql"

  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  sql_admin_username = module.key_vault.sql_username
  sql_admin_password = module.key_vault.sql_password

  sku_name = var.sku_name
}