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

**1- Clone this repository**
    git clone https://github.com/A-Janad/nd082-Azure-Cloud-DevOps-Starter-Code 

**2- Create an Azure Policy**

Log into your Azure account

    az login 

The policy we will deploy will prevent any new resources from being created without the tag "Udacity".

To run this, use the bash script:

    ./azure_policy/azure_policies_start.sh

If it works you should be able to view the assigned policy using:

    az policy assignment list

**3- Create Service Principle**

    az ad sp create-for-rbac --query "{client_id:appid, client_secret:password, tenant_id: tenant}"

***NOTE*** you can get your SUBSCRIPTION_ID using the following code:

        az account show --query "{subscription_id : id}"

This command will output 4 values:

{

  "appId": "00000000-0000-0000-0000-000000000000",

  "displayName": "azure-cli-2023-03-21-13-16-10",
  
  "password": "0000-0000-0000-0000-000000000000",
  
  "tenant": "00000000-0000-0000-0000-000000000000"

}

***Note*** You need next to map these values to the variables.json 

**4- Create Resource Group**

    az group create -l "LOCATION" -n "RESOURCE_GROUP_NAME" --tags "udacity"

***NOTE*** change "LOCATION" string to your location, add a new value for "RESOURCE_GROUP_NAME" 

**4- Create a variables.json file and update the values provided by the above steps**

variables.json

{

  "client_id": "",

  "client_secret": "",

  "subscription_id": "",

  "tenant_id": "",

  "resource_group_name": "",

  "image_name": "",

  "location": ""

}

**5- Deploy your packer image**
Run packer file

    packer build -var-file="variables.json" ./packer/server.json

**6- Deploy your infraustructure with Terraform**
    cd terraform/
    terraform init
    terraform plan -out solution.plan
    terraform apply -auto-approve


### Output
**Azure Policy Output**
You should see something like the screenshot below:

<img width="503" alt="azure_policy_output" src="https://user-images.githubusercontent.com/126161000/226779434-6d3cf4ed-bf34-4cbf-9f9f-6177648ca193.png">

**Create Resource Group Output**
You should see something like the screenshot below:

<img width="599" alt="resource_group_output" src="https://user-images.githubusercontent.com/126161000/226779488-6452894a-8bd4-4a35-8f2b-6fd1e01636d9.png">


**Terraform plan output**
After running the plan you should see the resources that will be built:

<img width="802" alt="terraform_plan_output" src="https://user-images.githubusercontent.com/126161000/226779589-565eb290-1fc9-49e7-bc8e-d55f6ed3daeb.png">


**Terraform apply output**
After running apply you should see the terraform output:

<img width="960" alt="terraform_apply_output" src="https://user-images.githubusercontent.com/126161000/226779614-6bae18b5-df51-4fc1-8411-507f92ca5527.png">

