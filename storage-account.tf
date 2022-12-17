# Create a Storage Account
resource "azurerm_storage_account" "frontend" {
  name                     = "selmayusra"
  resource_group_name      = azurerm_resource_group.slmysrRG.name
  location                 = azurerm_resource_group.slmysrRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}