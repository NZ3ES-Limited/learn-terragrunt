variable "environment" {
  description = "Environment"
  type        = string
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

# Jumpbox Configuration
variable "jumpbox_size" {
  description = "Size for jumpbox VM"
  type        = string
}

variable "create_jumpbox" {
  description = "Whether to create a jumpbox VM for private cluster access"
  type        = bool
}

variable "jumpbox_admin_username" {
  description = "Admin username for jumpbox VM"
  type        = string
}

variable "jumpbox_ssh_public_key" {
  description = "SSH public key for jumpbox VM access"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource Group"
}

variable "snet_id_generic" {
  type        = string
  description = "ID of Generic Subnet"
}

variable "snet_address_prefix_generic" {
  type        = string
  description = "Generic Subnet Address prefix"
}
