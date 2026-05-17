output "dns_zone_id" {
  description = "The ID of the DNS zone."
  value       = azurerm_dns_zone.main_dns_zone.id
}
