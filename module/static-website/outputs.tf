output "id" {
  description = "The ID of the resource group."
  value       = azurerm_static_web_app.this.id
}

output "name" {
  description = "The name of the resource group."
  value       = azurerm_static_web_app.this.name
}

output "location" {
  description = "The location of the resource group."
  value       = azurerm_static_web_app.this.location
}
