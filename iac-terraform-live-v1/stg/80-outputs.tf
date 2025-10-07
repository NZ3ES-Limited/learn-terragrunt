# Network Information
output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet_data.id
}

output "snet_aks_id" {
  description = "ID of the AKS subnet"
  value       = azurerm_subnet.aks_private_subnet.id
}
