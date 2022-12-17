# Assign variable for location of resources
variable "arm_location" {
  description = "The Azure region to create things in."
  default     = "East US"
}

# Assign variable for name of resources
variable "arm_resource_group" {
  default = "slmysrRG"
}

# Assign variable for vm admin password
variable "arm_vm_admin_password" {
  description = "Passwords for the root user in VMs."
  default     = "SUper.123-" # This should be hidden and passed as variable, doing this just for training purpose
}

# Assign variable for number of frontend instances
variable "arm_vm_count" {
  description = "Number of VM instances"
  default     = 2
}