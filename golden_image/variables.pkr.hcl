variable "gitVersion" {
  type    = string
  default = "1.0.0"
}

variable "armSubscriptionId" {
  type    = string
  default = "${env("ARM_SUBSCRIPTION_ID")}"
}

variable "armTenantId" {
  type    = string
  default = "${env("ARM_TENANT_ID")}"
}

variable "armClientId" {
  type    = string
  default = "${env("ARM_CLIENT_ID")}"
}

variable "armClientSecret" {
  type    = string
  default = "${env("ARM_CLIENT_SECRET")}"
}

variable "armResourceGroup" {
  type    = string
  default = "${env("ARM_RESOURCE_GROUP")}"
}
