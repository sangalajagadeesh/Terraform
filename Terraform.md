## Terraform: 25/Jul/2023,
### Story of LT
* Basic architecture
* ![preview](images/image1.png)
* LT has 3 customers who are ready to buy
     * TCS wants to run application on AWS
     * Infosys on Azure
     * JP Morgan on vmware
* How to automate these different deployments
     * Creating manually
     * For automation:
         * AWS has Cloud formation
         * Azure has ARM Templates
     * Terraform can automate infra creation in almost all the virtual environments and Terraform is an open source software and provides enterprise.
     * Terraform also allows us to deal with multiple environments
## 2nd Class 26/Jul/2023,
### What Is Terraform? 
Terraform is an IAC tool, used primarily by DevOps teams to automate various infrastructure tasks. The provisioning of cloud resources, for instance, is one of the main use cases of Terraform. It’s a cloud-agnostic, open-source provisioning tool written in the Go language and created by HashiCorp.
## Architecture of Terraform:
* Terraform is developed in Go language and installation of terraform is one executable
* Providers are not part of terraform installations as we try to create infra, as part of initializations providers are downloaded
* Providers have resources and datasources as part of it
![preview](images/image2.png)
### Concepts of Terraform:
* Provider: This determines the target area to create infra structure
     * [Refer Here](https://registry.terraform.io/browse/providers) for the list of provider
#### Terraform provider means:     
* A provider in Terraform is a plugin that enables interaction with an API. This includes Cloud providers and Software-as-a-service providers. The providers are specified in the Terraform configuration code. They tell Terraform which services it needs to interact with
* Terraform providers are of three categories
     * official
     * partner
     * community
* [Refer Here](https://developer.hashicorp.com/terraform/language/providers) for providers documenation by hashicorp
* Note: For you reference we have used the following template
#####Terraform AWS Provider:
```

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.33.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    features {

    }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "fromtf" {
    ami = "ami-03f65b8614a860c29"
    tags = {
      Name ="from terraform"
    }
    key_name = "my_id_rsa"
    vpc_security_group_ids = ["sg-05adaf452b268c335"]
    instance_type = "t2.micro"

}


resource "azurerm_resource_group" "test" {
    name = "test"
    location = "eastus"

}

```

