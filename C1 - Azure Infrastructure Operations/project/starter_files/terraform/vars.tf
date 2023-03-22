variable "resource_group_name" {
    description = "rsg for the virtual machine's name which will be created"
    default     = "udacity-project"
}

variable "location" {
  description = "azure region where resources will be located"
  default     = "North Europe"
}

variable "image_id" {
  description = "Enter the ID for the image which will be used for creating the Virtual Machines"
  default     = "/subscriptions/21347db0-e426-46ac-b8a8-cb3f9fee02da/resourceGroups/udacity-ahmed-rg/providers/Microsoft.Compute/images/udacity-packer-image"
}

variable "admin_username" {
  description = "Enter username to associate with the machine"
  default     = "aaj442"
}

variable "admin_password" {
  description = "Enter password to use to access the machine"
  default     = "Amin_442#"
}

variable "numberofvms" {
  description = "number of VMs to create"
  default     = 2
  type        = number 
}