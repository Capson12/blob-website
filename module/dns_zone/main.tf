resource "azurerm_dns_zone" "main_dns_zone" {
  name                = var.main_dns_zone_name
  resource_group_name = var.resource_group_name
}
