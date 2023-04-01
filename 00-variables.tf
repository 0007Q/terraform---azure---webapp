variable "location" {
  type = string
  default = "UKSouth"
}

variable "resource_group_name" {
    type = string
}

variable "azurerm_app_service_plan" {
    type = string
    default = "example-app-service-plan"
}

variable "azurerm_app_service_name" {
    type = string
    default = "example-app-service"
}

variable "sku_tier" {
  type = string
  default = "Standard"
}

variable "sku_size" {
  type = string
  default = "S1"
}

variable "dotNet_version" {
    type = string
    default = "v6.0"
}
