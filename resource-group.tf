# Create a Resource Group
resource "azurerm_resource_group" "slmysrRG" {
  name     = var.arm_resource_group
  location = var.arm_location
}