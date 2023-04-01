resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "example" {
  name                = var.azurerm_app_service_plan
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    "Name" = "Please Delete Me"
    "Application" = var.azurerm_app_service_name
  }

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_app_service" "example" {
  name                = var.azurerm_app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  tags = {
    "Name" = "Please Delete"
    "Application" = var.azurerm_app_service_name
  }

  site_config {
    dotnet_framework_version = var.dotNet_version
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
