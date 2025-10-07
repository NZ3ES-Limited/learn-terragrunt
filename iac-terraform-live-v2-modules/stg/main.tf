module "vnet" {
  source = "../modules/network"

  environment          = var.environment
  location             = "Australia Southeast" # OR australiasoutheast
  vnet_address         = "10.200.0.0/21"
  snet_address_aks     = "10.200.0.0/24"
  snet_address_appgw   = "10.200.1.0/24"
  snet_address_generic = "10.200.2.0/24"
  snet_address_int_lb  = "10.200.3.0/24"
}

module "jumpbox" {
  source                      = "../modules/jumpbox"
  snet_id_generic             = module.vnet.snet_id_generic
  resource_group_name         = module.vnet.resource_group_name
  resource_group_location     = module.vnet.resource_group_location
  snet_address_prefix_generic = join(",", module.vnet.snet_address_prefix_generic) #module.vnet.snet_address_prefix_generic output is list(string), however NSG expect a comma-separated list of IP addresses or address ranges using either IPv4 or IPv6

  environment            = var.environment
  jumpbox_size           = "Standard_B2s"
  create_jumpbox         = true
  jumpbox_admin_username = "azureuser"
  jumpbox_ssh_public_key = file("~/.ssh/id_rsa.pub")
}
