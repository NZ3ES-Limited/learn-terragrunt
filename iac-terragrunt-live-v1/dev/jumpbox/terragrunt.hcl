terraform {
  source = "../../../iac-terraform-live-v2-modules/modules/jumpbox"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "network" {
  config_path = "../network"

  # Mock outputs for validation when network module hasn't been applied yet
  mock_outputs = {
    resource_group_name         = "mock-rg"
    resource_group_location     = "newzealandnorth"
    snet_id_generic             = "/subscriptions/mock/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
    snet_address_prefix_generic = ["10.100.2.0/24"]
  }

  # Allow the dependency outputs to be empty during plan/validate
  mock_outputs_allowed_terraform_commands = ["validate", "init"]
}

inputs = {
  resource_group_name         = dependency.network.outputs.resource_group_name
  resource_group_location     = dependency.network.outputs.resource_group_location
  snet_id_generic             = dependency.network.outputs.snet_id_generic
  snet_address_prefix_generic = join(",", dependency.network.outputs.snet_address_prefix_generic)
  environment                 = "tg-dev"
  jumpbox_size                = "Standard_B2s"
  create_jumpbox              = true
  jumpbox_admin_username      = "azureuser"
  jumpbox_ssh_public_key      = file("~/.ssh/id_rsa.pub")
}
