# Virtual Network
resource "azurerm_virtual_network" "vnet_data" {
  name                = "vnet-data-${var.environment}"
  address_space       = [var.vnet_address]
  location            = azurerm_resource_group.rg_data.location
  resource_group_name = azurerm_resource_group.rg_data.name

  tags = merge(
    var.tags,
    {
      Environment = "${var.environment}"
    }
  )
}

## Subnets
# AKS Subnet
resource "azurerm_subnet" "aks_private_subnet" {
  name                 = "snet-aks-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg_data.name
  virtual_network_name = azurerm_virtual_network.vnet_data.name
  address_prefixes     = [var.subnet_address_aks]

  # Disable private endpoint network policies
  private_endpoint_network_policies = "Disabled"

}

# Application Gateway Subnet (for future ingress)
resource "azurerm_subnet" "appgw" {
  name                 = "snet-appgw-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg_data.name
  virtual_network_name = azurerm_virtual_network.vnet_data.name
  address_prefixes     = [var.subnet_address_appgw]
}

# Jumpbox Subnet (for management access)
resource "azurerm_subnet" "generic" {
  name                 = "snet-generic-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg_data.name
  virtual_network_name = azurerm_virtual_network.vnet_data.name
  address_prefixes     = [var.snet_address_generic]
}

# Internal LoadBalancer Subnet
resource "azurerm_subnet" "aks_int_lb_subnet" {
  name                 = "snet-int-lb-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg_data.name
  virtual_network_name = azurerm_virtual_network.vnet_data.name
  address_prefixes     = [var.snet_int_lb]
}
