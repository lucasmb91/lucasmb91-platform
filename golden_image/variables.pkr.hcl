variable "gitVersion" {
  type    = string
  default = "1.0.0"
}

variable "ARM_SUBSCRIPTION_ID" {
  type = string
  default = "${env("ARM_SUBSCRIPTION_ID")}"
}

variable "ARM_TENANT_ID" {
  type = string
  default = "${env("ARM_TENANT_ID")}"
}

variable "ARM_CLIENT_ID" {
  type = string
  default = "${env("ARM_CLIENT_ID")}"
}

variable "ARM_CLIENT_SECRET" {
  type = string
  default = "${env("ARM_CLIENT_SECRET")}"
}

variable "ARM_RESOURCE_GROUP" {
  type = string
  default = "${env("ARM_RESOURCE_GROUP")}"
} 
