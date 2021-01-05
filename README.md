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

### Customizing the deployment
This deployment can be customized by using the terraform.tfvars file. it will use preset and environemnt variables that will cater the deployment to suit your needs.

Please refer to the table below to see each variable with a brief description:

|Varibale name|Description|
|-------------|-----------|
|prefix       |The prefix which should be used for all resources in this example           |
|location     |The Azure Region in which all resources in this example should be created.           |
|username     |The username of the VM when it gets created (set as an env variable in terraform.tfvars)           |
|password     |The password of the VM when it gets created for the username (set as an env variable in terraform.tfvars)           |
|VM-count     | the number of virtual machines desured in the deployment          |

### Output
After the building of the infrastucture is complete, you will be prompted that all of your resources are indeed created and you can check with the either through Azure Portal or AZ CLI.