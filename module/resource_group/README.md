# Azure Resource Group Module

This Terraform module creates an Azure Resource Group.

## Usage

```hcl
module "resource_group" {
  source   = "git::https://github.com/Capson12/blob-website.git//module/resource_group"
  name     = "my-rg"
  location = "East US"
  tags = {
    environment = "dev"
  }
}
```

## Inputs
- `name`: Resource group name (string, required)
- `location`: Azure region (string, required)
- `tags`: Map of tags (optional)

## Outputs
- `id`: Resource group ID
- `name`: Resource group name
- `location`: Resource group location

## Terragrunt Example

```hcl
terraform {
  source = "git::https://github.com/Capson12/blob-website.git//module/resource_group"
}

inputs = {
  name     = "my-rg"
  location = "East US"
}
```
