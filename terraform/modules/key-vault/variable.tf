variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Existing Azure resource group name"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID"
  type        = string
}
variable "secret_reader_principal_id" {
  description = "Principal ID of the managed identity allowed to read Key Vault secrets"
  type        = string
}