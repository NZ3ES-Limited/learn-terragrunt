output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg_data.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.rg_data.location
}
output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet_data.id
}

output "snet_id_generic" {
  description = "ID of the Generic Subnet"
  value       = azurerm_subnet.generic.id
}

output "snet_address_prefix_generic" {
  description = "Address Prefix of the Generic Subnet"
  value       = azurerm_subnet.generic.address_prefixes # output as List of string
}
