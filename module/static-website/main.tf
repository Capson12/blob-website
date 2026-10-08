resource "azurerm_static_web_app" "this" {
  name                = "smtx-${var.prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_size = var.sku_size
  repository_branch = var.repository_branch
  repository_url = var.repository_url
  repository_token = var.repository_token

  tags = var.tags
}