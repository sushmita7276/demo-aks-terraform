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
variable "terraform_principal_id" {
  description = "Object ID of the Terraform deployment principal"
  type        = string
}

variable "aks_secrets_provider_principal_id" {
  description = "Object ID of the AKS Key Vault Secrets Provider identity"
  type        = string
}
variable "sql_username" {
  type      = string
  sensitive = true
}

variable "sql_password" {
  type      = string
  sensitive = true
}

variable "app_secret" {
  type      = string
  sensitive = true
}