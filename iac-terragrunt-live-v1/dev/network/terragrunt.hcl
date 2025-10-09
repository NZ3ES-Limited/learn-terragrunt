include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  # source = "../../../iac-terraform-live-v2-modules/modules/network"
  source = "git@github.com:NZ3ES-Limited/learn-terragrunt.git//iac-terraform-live-v2-modules/modules/network?ref=main" # Downloading Terraform configurations from git::ssh://git@github.com/NZ3ES-Limited/learn-terragrunt.git?ref=main into ./.terragrunt-cache/z_aOuZBTyYIG-ZINyE0Tws1i5E4/mnd2f5d_1ggUyqVZynPFjHq7mDU
}

inputs = {
  environment          = "tg-${include.root.locals.environment}"
  location             = "New Zealand North" # OR newzealandnorth
  vnet_address         = "10.100.0.0/21"
  snet_address_aks     = "10.100.0.0/24"
  snet_address_appgw   = "10.100.1.0/24"
  snet_address_generic = "10.100.2.0/24"
  snet_address_int_lb  = "10.100.3.0/24"
}