variable "prefix" {
    type = string
    description = ""
  
}

variable "resource_group_name" {
    type = string
    description = ""
}

variable "location" {
    type = string
    description = ""
  
}

variable "sku_size" {
    type = string
  
}

variable "repository_branch" {
    type = string
  
}

variable "repository_token" {
    type = string
  
}

variable "repository_url" {
    type = string
  
}

variable "tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default     = {}
}
