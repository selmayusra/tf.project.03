# Create a backend
# backend.tf file is used to store the state file in Azure Storage Account

terraform {
  backend "azurerm" {
    storage_account_name = "selmayusra"     # Use your own unique name here
    container_name       = "terraform-slmysr"         # Use your own container name here
    key                  = "terraform.tfstate" # Add a name to the state file
    resource_group_name  = "tf.selmayusra"   # Use your own resource group name here
  }
}