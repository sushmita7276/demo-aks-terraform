output "key_vault_name" {
  description = "Name of the created Key Vault"
  value       = azurerm_key_vault.kv.name
}

output "key_vault_id" {
  description = "Resource ID of the Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}
output "access_policy_ids" {
  description = "IDs of the Key Vault access policies"
  value = [
    azurerm_key_vault_access_policy.terraform.id,
    azurerm_key_vault_access_policy.aks_secrets_provider.id
  ]
}

output "sql_username" {
  description = "SQL administrator username stored in Key Vault"
  value       = azurerm_key_vault_secret.sql_username.value
  sensitive   = true
}

output "sql_password" {
  description = "SQL administrator password stored in Key Vault"
  value       = azurerm_key_vault_secret.sql_password.value
  sensitive   = true
}