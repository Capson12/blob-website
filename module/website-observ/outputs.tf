output "app_insigts_connection_string" {
    value = azurerm_application_insights.main-observ.connection_string
    sensitive = true
  
}