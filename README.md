# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
**Prerequisites**
1. Microsoft Azure Account
2. Packer (install with Homebrew if on MacOS)
3. Terraform (install with Homebrew if on MacOS)
4. AZ CLU (install with Homebrew if on MacOS)

### Resolving dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Running the project
First, you need to create a resource group to build your Packer image in. In the code, by default the resource group that the image will try to build in is *"udacity-project-1-resources"*

Feel free to change the resource group name. However, take note that 
```JSON
    {
    "managed_image_resource_group_name": "udacity-project-1-resources"
    }
```
will have to be update in: */packer/server.json*


In order to create a resource group, you can run the following command:
```bash
az group create -l <location> --name <rg-bane>
```
or use the portal.

Next, we need to build the packer image:
1. cd into ./packer
2. run the following command:
> *packer build ./server.json*

3. while the image is building, we can initialize Terraform by going to Terraform directory *(/terraform)* running
  >terraform init
4. After the image is built and added to the resource group, update Terraform to import the state of the resource group
> terraform import azurerm_managed_disk.main <rg_id>

*resource group ID can be found from the Azure portal or from the AZ CLI using the following commnad:*
> az group show --name <name of the resource group>

5. Then we can view the plan thhat Terraform has for us
> terraform plan -out solution.plan

6. Finally, apply the infrastructure to your Azure cluod by running:
> terraform apply

*You will be prompted to enter the username & password of the VMs. and then you need to accept the plan.*

*NOTE: The prefix can be changed by passing a "prefix" variable into terraform apply command*

---
7. **DESTROY THE INFRASTRUCTURE**
o avoid unnecessary costs, please run the following command after your build is complete and follow the prompts
> terraform destroy
---

### Output
After the building of the infrastucture is complete, you will be prompted that all of your resources are indeed created and you can check with the either through Azure Portal or AZ CLI.


#### Terraform Plan:
The plan generated by Terraform will be similar to the following:
```JSON
{
  .
  .
  .
  .
  .
      + admin_password                  = (sensitive value)
      + admin_username                  = "ghawanni"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-project-1-machine-2"
      + network_interface_ids           = (known after apply)
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "udacity-project-1-resources"
      + size                            = "Standard_F2"
      + source_image_id                 = "/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/images/Ubuntu18.04LTS"
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_managed_disk.main[0] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-project-1-managed-disk-0"
      + resource_group_name  = "udacity-project-1-resources"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "environment" = "Production"
        }
    }

  # azurerm_managed_disk.main[1] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-project-1-managed-disk-1"
      + resource_group_name  = "udacity-project-1-resources"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "environment" = "Production"
        }
    }

  # azurerm_managed_disk.main[2] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-project-1-managed-disk-2"
      + resource_group_name  = "udacity-project-1-resources"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "environment" = "Production"
        }
    }

  # azurerm_network_interface.main[0] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-project-1-nic-0"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-project-1-resources"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "internal-0"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.main[1] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-project-1-nic-1"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-project-1-resources"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "internal-1"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.main[2] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-project-1-nic-2"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-project-1-resources"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "internal-2"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_security_group.main will be created
  + resource "azurerm_network_security_group" "main" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "udacity-project-1-nsg"
      + resource_group_name = "udacity-project-1-resources"
      + security_rule       = (known after apply)
    }

  # azurerm_network_security_rule.AllowInternal will be created
  + resource "azurerm_network_security_rule" "AllowInternal" {
      + access                      = "Allow"
      + destination_address_prefix  = "10.0.2.0/24"
      + destination_port_range      = "*"
      + direction                   = "Inbound"
      + id                          = (known after apply)
      + name                        = "AllowSubnetInternal"
      + network_security_group_name = "udacity-project-1-nsg"
      + priority                    = 100
      + protocol                    = "Tcp"
      + resource_group_name         = "udacity-project-1-resources"
      + source_address_prefix       = "10.0.2.0/24"
      + source_port_range           = "*"
    }

  # azurerm_network_security_rule.DenyExternal will be created
  + resource "azurerm_network_security_rule" "DenyExternal" {
      + access                      = "Deny"
      + destination_address_prefix  = "*"
      + destination_port_range      = "*"
      + direction                   = "Inbound"
      + id                          = (known after apply)
      + name                        = "DenyAllExternal"
      + network_security_group_name = "udacity-project-1-nsg"
      + priority                    = 110
      + protocol                    = "Tcp"
      + resource_group_name         = "udacity-project-1-resources"
      + source_address_prefix       = "*"
      + source_port_range           = "*"
    }

  # azurerm_public_ip.main will be created
  + resource "azurerm_public_ip" "main" {
      + allocation_method       = "Static"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "udacity-project-1-public-ip"
      + resource_group_name     = "udacity-project-1-resources"
      + sku                     = "Basic"
    }

  # azurerm_subnet.internal will be created
  + resource "azurerm_subnet" "internal" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.2.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "internal"
      + resource_group_name                            = "udacity-project-1-resources"
      + virtual_network_name                           = "udacity-project-1-network"
    }

  # azurerm_virtual_network.main will be created
  + resource "azurerm_virtual_network" "main" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "udacity-project-1-network"
      + resource_group_name   = "udacity-project-1-resources"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

Plan: 20 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
```

#### Terraform Output:
The output will look similar to this:
```JSON

azurerm_network_security_group.main: Creating...
azurerm_public_ip.main: Creating...
azurerm_virtual_network.main: Creating...
azurerm_availability_set.main[0]: Creating...
azurerm_managed_disk.main[1]: Creating...
azurerm_availability_set.main[1]: Creating...
azurerm_availability_set.main[2]: Creating...
azurerm_managed_disk.main[2]: Creating...
azurerm_managed_disk.main[0]: Creating...
azurerm_availability_set.main[2]: Creation complete after 4s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/availabilitySets/udacity-project-1-aset-2]
azurerm_availability_set.main[0]: Creation complete after 5s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/availabilitySets/udacity-project-1-aset-0]
azurerm_availability_set.main[1]: Creation complete after 5s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/availabilitySets/udacity-project-1-aset-1]
azurerm_public_ip.main: Creation complete after 7s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/publicIPAddresses/udacity-project-1-public-ip]
azurerm_managed_disk.main[0]: Creation complete after 7s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/disks/udacity-project-1-managed-disk-0]
azurerm_lb.main: Creating...
azurerm_managed_disk.main[1]: Creation complete after 7s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/disks/udacity-project-1-managed-disk-1]
azurerm_managed_disk.main[2]: Creation complete after 7s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/disks/udacity-project-1-managed-disk-2]
azurerm_network_security_group.main: Creation complete after 9s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkSecurityGroups/udacity-project-1-nsg]
azurerm_virtual_network.main: Creation complete after 9s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/virtualNetworks/udacity-project-1-network]
azurerm_network_security_rule.AllowInternal: Creating...
azurerm_network_security_rule.DenyExternal: Creating...
azurerm_subnet.internal: Creating...
azurerm_lb.main: Creation complete after 5s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/loadBalancers/udacity-project-1-LoadBalancer]
azurerm_lb_backend_address_pool.main: Creating...
azurerm_lb_backend_address_pool.main: Creation complete after 2s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/loadBalancers/udacity-project-1-LoadBalancer/backendAddressPools/BackEndAddressPool]
azurerm_subnet.internal: Creation complete after 6s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/virtualNetworks/udacity-project-1-network/subnets/internal]
azurerm_network_interface.main[1]: Creating...
azurerm_network_interface.main[2]: Creating...
azurerm_network_interface.main[0]: Creating...
azurerm_network_security_rule.DenyExternal: Still creating... [10s elapsed]
azurerm_network_security_rule.AllowInternal: Still creating... [10s elapsed]
azurerm_network_interface.main[2]: Creation complete after 4s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkInterfaces/udacity-project-1-nic-2]
azurerm_network_security_rule.DenyExternal: Creation complete after 13s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkSecurityGroups/udacity-project-1-nsg/securityRules/DenyAllExternal]
azurerm_network_interface.main[1]: Creation complete after 8s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkInterfaces/udacity-project-1-nic-1]
azurerm_network_interface.main[0]: Still creating... [10s elapsed]
azurerm_network_interface.main[0]: Creation complete after 11s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkInterfaces/udacity-project-1-nic-0]
azurerm_linux_virtual_machine.main[0]: Creating...
azurerm_linux_virtual_machine.main[2]: Creating...
azurerm_linux_virtual_machine.main[1]: Creating...
azurerm_network_security_rule.AllowInternal: Still creating... [20s elapsed]
azurerm_network_security_rule.AllowInternal: Creation complete after 24s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Network/networkSecurityGroups/udacity-project-1-nsg/securityRules/AllowSubnetInternal]
azurerm_linux_virtual_machine.main[2]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[0]: Creation complete after 1m54s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/virtualMachines/udacity-project-1-machine-0]
azurerm_linux_virtual_machine.main[2]: Creation complete after 1m54s [id=/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/virtualMachines/udacity-project-1-machine-2
```