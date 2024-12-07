locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name          = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspace_suffix}"
  sa_name          = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspace_suffix}"
  web_suffix       = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg_web" {
  name     = local.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sa_web" {
  name                     = "${lower(local.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account_static_website" "sa_website" {
  storage_account_id = azurerm_storage_account.sa_web.id
  index_document     = var.index_document
  # Optional: Add error_document if needed
  # error_document     = var.error_document
}

resource "azurerm_storage_container" "web_container" {
  name                  = "$web"
  storage_account_id    = azurerm_storage_account.sa_web.id # Bruk 'id' her
  container_access_type = "private"
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name # Bruk 'name' her i stedet for 'id'
  storage_container_name = azurerm_storage_container.web_container.name
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}
