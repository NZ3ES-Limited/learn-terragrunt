include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../iac-terraform-live-v2-modules/modules//jumpbox"
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  snet_id_generic             = dependency.network.outputs.snet_id_generic
  resource_group_name         = dependency.network.outputs.resource_group_name
  resource_group_location     = dependency.network.outputs.resource_group_location
  snet_address_prefix_generic = join(",", dependency.network.outputs.snet_address_prefix_generic)

  environment            = "tg-stg"
  jumpbox_size           = "Standard_B2s"
  create_jumpbox         = true
  jumpbox_admin_username = "azureuser"
  jumpbox_ssh_public_key = file("~/.ssh/id_rsa.pub")
}