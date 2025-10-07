# Jumpbox for private cluster access
resource "azurerm_public_ip" "aks_jumpbox_pip" {
  count               = var.create_jumpbox ? 1 : 0
  name                = "${var.environment}-jumpbox-pip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = local.common_tags
}

resource "azurerm_network_interface" "aks_jumpbox_net" {
  count               = var.create_jumpbox ? 1 : 0
  name                = "${var.environment}-jumpbox-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.snet_id_generic
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.aks_jumpbox_pip[0].id
  }

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "aks_jumpbox_vm" {
  count               = var.create_jumpbox ? 1 : 0
  name                = "${var.environment}-jumpbox"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  size                = var.jumpbox_size
  admin_username      = var.jumpbox_admin_username

  # Disable password authentication and use SSH keys only
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.aks_jumpbox_net[0].id,
  ]

  admin_ssh_key {
    username   = var.jumpbox_admin_username
    public_key = var.jumpbox_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS" #expected os_disk.0.storage_account_type to be one of ["Premium_LRS" "Standard_LRS" "StandardSSD_LRS" "StandardSSD_ZRS" "Premium_ZRS"], got Premium_SSD
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  # Custom data to install kubectl and other tools
  #   custom_data = base64encode(file("init.sh"))
  #   custom_data = base64encode(templatefile("${path.module}/init.sh", {
  #     resource_group_name = var.resource_group_name
  #     aks_cluster_name    = azurerm_kubernetes_cluster.aks_pvt_cluster.name
  #   }))

  tags = local.common_tags
}

# Network Security Group for Jumpbox Subnet
# A number between 100 and 4096. Rules are processed in priority order, with lower numbers processed before higher numbers because lower numbers have higher priority.
resource "azurerm_network_security_group" "nsg_snet_generic" {
  name                = "${var.environment}-nsg-snet-generic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  # Allow inbound from all to Jumphost, port 22
  security_rule {
    name                       = "AllowAppGwInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22"]
    source_address_prefix      = "Internet"
    destination_address_prefix = var.snet_address_prefix_generic
  }

  tags = local.common_tags
}

# Associate NSG with AKS Subnet
resource "azurerm_subnet_network_security_group_association" "jumpbox_subnet_associate_nsg" {
  subnet_id                 = var.snet_id_generic
  network_security_group_id = azurerm_network_security_group.nsg_snet_generic.id
}
