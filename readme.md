# Terraform Project in Azure 

## Description



This terraform project is contain that create an Azure Virtual Machine, Virtual Network, Storage Account and Load Balancer into determined a Resource Group. 


## provider.tf
The purpose of the provider.tf file, Terraform is a plugin that enables interaction with an API. The providers are specified in the Terraform configuration code. Terraform providers are downloaded and installed during the terraform init stage of the Terraform workflow. 

## resourse-group.tf
The 'resourse-group.tf' file creates the resourse group. 

## variable.tf 
The 'variables.tf' file contains the location and name of resoruces for variables, the name of the password for the root user in the virtual machines, and the number of frontend instances.

## vnet.tf
The 'vnet.tf' file creates a virtual network  in Azure with a subnet or a set of subnets passed in as input parameters.

## subnet.tf
The 'subnet.tf' file creates two subnet that one for the frontend, one for the backend.

## load-balancer.tf
The load-balancer.tf file creates an Azure load balancer, a public IP address, and associated resources. The load balancer will be created in the specified resource group and location, and will be configured to use the specified public IP address. The code also defines two probes and two rules for the load balancer, on ports 80 and 443. The probes will be used to monitor the health of the backend instances, and the rules will define how traffic is distributed to the backend instances. This configuration will create the resources necessary to set up a load balancer in Azure, which can be used to distribute incoming traffic across multiple backend instances.

## storage-account.tf
The 'storage-account.tf' file creates a storage account.

## backend.tf
backend.tf file is used to store the state file in Azure Storage Account. The backend is used to store the state of Terraform's managed resources so that Terraform knows what has been created and what changes are necessary.

## output.tf
The outputs are the IDs of the frontend, backend, as well as the IP address of the frontend public IP. These outputs can be used to display or reference important information about the resources created by the Terraform configuration.

## virtual-machine.tf 
The 'virtual-machines.tf' file creates an availability set for the virtual-machines, a storage container, a network interface, and a virtual-machine and also they contain frontend and backend instance. The virtual machine includes storage for an OS disk, storage for an optional data disk, an OS profile, an OS profile Linux configuration, and flags to delete the OS and data disks on termination. 



## script file from Terraform 


| Name | Type |
|------|------|
| [azurerm_availability_set.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/availability_set) | script resource |
| [azurerm_lb.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb) | script resource |
| [azurerm_lb_backend_address_pool.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_backend_address_pool) | script resource |
| [azurerm_lb_probe.port443](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_probe) | script resource |
| [azurerm_lb_probe.port80](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_probe) | script resource |
| [azurerm_lb_rule.port443](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | script resource |
| [azurerm_lb_rule.port80](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | script resource |
| [azurerm_network_interface.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface) | script resource |
| [azurerm_network_interface_backend_address_pool_association.ba_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface_backend_address_pool_association) | script resource |
| [azurerm_public_ip.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/public_ip) | script resource |
| [azurerm_resource_group.terraform_sample](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | script resource |
| [azurerm_storage_account.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/storage_account) | script resource |
| [azurerm_storage_container.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/storage_container) | script resource |
| [azurerm_subnet.my_subnet_backend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | script resource |
| [azurerm_subnet.my_subnet_dmz](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | script resource |
| [azurerm_subnet.my_subnet_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | script resource |
| [azurerm_virtual_machine.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/virtual_machine) | script resource |
| [azurerm_virtual_network.my_vn](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/virtual_network) | script resource |


## Needed of commands 
1. 'az login' command
```sh
az login
```
2. 'terraform init' command

```sh
terraform init
```
3. 'terraform plan' command.

```sh
terraform plan
```

4. 'terraform apply' command
```sh
terraform apply
```

 
