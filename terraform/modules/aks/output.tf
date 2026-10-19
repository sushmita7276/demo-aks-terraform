
output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_id" {
  description = "AKS cluster resource ID"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  description = "AKS API server FQDN"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "node_resource_group" {
  description = "AKS-managed node resource group"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}
output "key_vault_secrets_provider_identity_object_id" {
  description = "Object ID of the AKS Key Vault Secrets Provider identity"
  value       = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id
}

output "key_vault_secrets_provider_identity_client_id" {
  description = "Client ID of the AKS Key Vault Secrets Provider identity"
  value       = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
}