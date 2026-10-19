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
output "secrets_reader_role_assignment_id" {
  description = "ID of the Key Vault secrets reader RBAC assignment"
  value       = azurerm_role_assignment.secrets_reader.id
}