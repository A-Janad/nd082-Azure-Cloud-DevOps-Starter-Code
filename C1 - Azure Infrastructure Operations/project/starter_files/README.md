# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure. The project also requires applying an Azure policy to stop the creation of any new resources that lack tags. Additionally, a VM image will be created using Packer to be used as the load balancer. Finally, the resources will be deployed in a scalable and immutable manner through Terraform.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

1- Clone this repository
    git clone https://github.com/A-Janad/nd082-Azure-Cloud-DevOps-Starter-Code 

2- Create an Azure Policy

Log into your Azure account

    az login 

The policy we will deploy will prevent any new resources from being created without the tag "Udacity".

To run this, use the bash script:

    ./azure_policy/azure_policies_start.sh

If it works you should be able to view the assigned policy using:

    az policy assignment list



### Output
**Azure Policy Output**
You should see something like the screenshot below:
![azure_policy_output](\screenshots\azure_policy_output.png)

