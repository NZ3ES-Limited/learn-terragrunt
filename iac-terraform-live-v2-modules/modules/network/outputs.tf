output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg_data.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet_data.id
}
