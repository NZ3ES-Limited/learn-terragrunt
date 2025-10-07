variable "environment" {
  description = "Environment"
  type        = string
}

variable "location" {
  description = "Azure Location (Region)"
  type        = string
  default     = "australiaeast"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project      = "AKS-Private-Cluster"
    Owner        = "DataPlatform-Team"
    ManagedBy    = "IaC"
    CostCenter   = "IT-DataPlatform"
    BusinessUnit = "Engineering"
  }
}

# Network Configuration
variable "vnet_address" {
  description = "Address space for the virtual network"
  type        = string
}

variable "snet_address_aks" {
  description = "Address prefix for AKS subnet"
  type        = string
}

variable "snet_address_appgw" {
  description = "Address prefix for Application Gateway subnet"
  type        = string
}


variable "snet_address_generic" {
  description = "Address prefix for jumpbox subnet"
  type        = string
}

variable "snet_address_int_lb" {
  description = "Address prefix for Internal Load Balancer"
  type        = string
}
