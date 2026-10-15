resource "azurerm_static_web_app" "this" {
  name                = "smtx-${var.prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_size = var.sku_size
  tags = var.tags
}