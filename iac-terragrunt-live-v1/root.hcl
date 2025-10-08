generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "nz3estfstate"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  subscription_id = "${get_env("TG_azure_subscription")}"
  client_id       = "${get_env("TG_azure_client_id", "default_client_id")}"
  client_secret   = "${get_env("TG_azure_client_secret")}"
  tenant_id       = "${get_env("TG_azure_tenant_id")}"
  features {}
}
EOF
}
