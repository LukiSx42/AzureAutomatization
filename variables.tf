variable "tenant_id" {
  description = "The Tenant ID for Azure"
  type        = string
}

variable "object_id" {
  description = "The Object ID for the service principal"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "client_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret for the Service Principal"
  type        = string
  sensitive   = true
}