
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
