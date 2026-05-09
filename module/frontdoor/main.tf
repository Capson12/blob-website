resource "azurerm_dns_zone" "main_dns_zone" {
  name                = var.main_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_cdn_frontdoor_profile" "main_profile" {
  name                = var.main_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = var.main_profile_sku
}

resource "azurerm_cdn_frontdoor_endpoint" "main_endpoint" {
  name                     = var.main_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main_profile.id
}

resource "azurerm_cdn_frontdoor_origin_group" "main_origin_group" {
  name                     = var.main_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main_profile.id

  load_balancing {}
}

resource "azurerm_cdn_frontdoor_origin" "main_origin" {
  name                           = var.main_origin_name
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.main_origin_group.id
  host_name                      = var.main_origin_host_name
  certificate_name_check_enabled = var.certificate_name_check_enabled
}

resource "azurerm_cdn_frontdoor_custom_domain" "main_custom_domain" {
  name                     = var.main_custom_domain_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main_profile.id
  dns_zone_id              = azurerm_dns_zone.main_dns_zone.id
  host_name                = azurerm_cdn_frontdoor_origin.main_origin.host_name

  tls {
    certificate_type = var.certificate_type
  }
}

resource "azurerm_cdn_frontdoor_route" "main_route" {
  name                          = var.main_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.main_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.main_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.main_origin.id]

  cdn_frontdoor_custom_domain_ids = [
    azurerm_cdn_frontdoor_custom_domain.main_custom_domain.id,
  ]

  patterns_to_match   = var.patterns_to_match
  supported_protocols = var.supported_protocols
}

resource "azurerm_cdn_frontdoor_firewall_policy" "main_firewall_policy" {
  name                = var.main_firewall_policy_name
  resource_group_name = var.resource_group_name
  sku_name            = azurerm_cdn_frontdoor_profile.main_profile.sku_name
  mode                = var.firewall_policy_mode
}

resource "azurerm_cdn_frontdoor_security_policy" "main_security_policy" {
  name                     = var.main_security_policy_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main_profile.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.main_firewall_policy.id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.main_custom_domain.id
        }

        patterns_to_match = var.patterns_to_match
      }
    }
  }
}

