
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
module "sql" {
  source = "./modules/azure-sql"

  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  sql_admin_username = var.sql_admin_username
  sql_admin_password = var.sql_admin_password

  sku_name  = var.sku_name
  client_ip = var.client_ip
}

resource "azurerm_user_assigned_identity" "app" {
  name                = "demo-aks-app-identity"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  secret_reader_principal_id = azurerm_user_assigned_identity.app.principal_id
}