
output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "snetaks_subnet_id" {
  description = "AKS subnet ID"
  value       = azurerm_subnet.snetaks.id
}
