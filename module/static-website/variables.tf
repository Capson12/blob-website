variable "prefix" {
  description = "Prefix used to construct the static web app name."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the static web app."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the static web app."
  type        = string
}

variable "sku_size" {
  description = "SKU size for the static web app."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the static web app."
  type        = map(string)
  default     = {}
}
