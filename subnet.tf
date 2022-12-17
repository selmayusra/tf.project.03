# Create a Subnet Frontend
resource "azurerm_subnet" "subnet_frontend" {
  name                 = "subnet_frontend"
  resource_group_name  = azurerm_resource_group.slmysrRG.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a Subnet backend
resource "azurerm_subnet" "subnet_backend" {
  name                 = "subnet_backend"
  resource_group_name  = azurerm_resource_group.slmysrRG.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}