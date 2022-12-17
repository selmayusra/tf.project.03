# Create a virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.slmysrRG.location
  resource_group_name = azurerm_resource_group.slmysrRG.name
}

