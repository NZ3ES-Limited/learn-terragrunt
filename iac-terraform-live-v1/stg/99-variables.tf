variable "environment" {
  description = "Environment"
  type        = string
  default     = "stg"
}

variable "location" {
  description = "Azure Location (Region)"
  type        = string
  default     = "australiaeast"
}

variable "azure_tenant_id" {
  default = ""
}

variable "subscription" {
  description = "NZ3ES Subscription for stg env"
  type        = string
  default     = ""
}

variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
  default     = "868359e0-e5eb-461d-97cc-a0335123211c"
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
  default     = ""
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
  default     = "10.200.0.0/21"
}

variable "subnet_address_aks" {
  description = "Address prefix for AKS subnet"
  type        = string
  default     = "10.200.0.0/24"
}

variable "subnet_address_appgw" {
  description = "Address prefix for Application Gateway subnet"
  type        = string
  default     = "10.200.1.0/24"
}


variable "snet_address_generic" {
  description = "Address prefix for jumpbox subnet"
  type        = string
  default     = "10.200.2.0/24"
}

variable "snet_int_lb" {
  description = "Address prefix for Internal Load Balancer"
  type        = string
  default     = "10.200.3.0/24"
}
