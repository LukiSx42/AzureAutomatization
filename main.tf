resource "azurerm_resource_group" "test" {
  name     = "test-resources"
  location = "westeurope"
}

data "azurerm_client_config" "example" {}

resource "random_password" "secret" {
  count  = 10
  length = 16
  special = true
}

resource "azurerm_key_vault" "test" {
  count               = 10
  name                = "test2-vault-${count.index + 1}"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id    = var.tenant_id
    object_id    = var.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Update",
      "Import",
      "Backup",
      "Restore",
      "Recover",
      "Purge",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Backup",
      "Restore",
      "Recover",
      "Purge",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Delete",
      "Create",
      "Import",
      "Update",
      "ManageContacts",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers",
    ]
  }
}

resource "azurerm_key_vault_secret" "test" {
  count        = 10
  name         = "test-secret-${count.index + 1}"
  value        = random_password.secret[count.index].result
  key_vault_id = azurerm_key_vault.test[count.index].id
}