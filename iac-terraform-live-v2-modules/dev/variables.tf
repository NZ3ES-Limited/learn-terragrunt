variable "azure_tenant_id" {
}

variable "subscription" {
  description = "NZ3ES Subscription for stg env"
  type        = string
}

variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
  default     = "868359e0-e5eb-461d-97cc-a0335123211c"
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
}
