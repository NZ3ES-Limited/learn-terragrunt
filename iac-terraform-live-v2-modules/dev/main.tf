module "vnet" {
  source = "../modules/network"

  environment          = "tfmodule-dev"
  location             = "New Zealand North" # OR newzealandnorth
  vnet_address         = "10.100.0.0/21"
  snet_address_aks     = "10.100.0.0/24"
  snet_address_appgw   = "10.100.1.0/24"
  snet_address_generic = "10.100.2.0/24"
  snet_address_int_lb  = "10.100.3.0/24"
}
