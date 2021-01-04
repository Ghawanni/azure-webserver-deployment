variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-project-1"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "eastus"
}

variable "username" {
  description = "The username of the VM when it gets created"
}

variable "password" {
  description = "The password of the VM when it gets created for the username"
}

variable "VM-count"{
  description = "the number of virtual machines desured in the deployment"
  default = 3
}

variable "image-id"{
  description = "The id of the image to be used to build the VMs"
  default = "/subscriptions/4fc8a9ce-bdb4-476f-aa96-2948a69c3f62/resourceGroups/udacity-project-1-resources/providers/Microsoft.Compute/images/Ubuntu18.04LTS"
}