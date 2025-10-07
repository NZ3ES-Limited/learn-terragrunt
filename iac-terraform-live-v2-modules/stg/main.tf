module "vnet" {
  source = "../modules/network"

  environment          = "tfmodule-stg"
  location             = "Australia Southeast" # OR australiasoutheast
  vnet_address         = "10.200.0.0/21"
  snet_address_aks     = "10.200.0.0/24"
  snet_address_appgw   = "10.200.1.0/24"
  snet_address_generic = "10.200.2.0/24"
  snet_address_int_lb  = "10.200.3.0/24"
}
