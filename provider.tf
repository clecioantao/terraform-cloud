terraform {
  required_version = ">= 1.5.0"
  backend "remote" {
    organization = "labcle" # Nome da  organização

    workspaces {
      name = "terraform-cloud" # Nome do workspace criado no HCP Terraform
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

}