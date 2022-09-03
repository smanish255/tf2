terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.19.1"
    }
  }
}

provider "azurerm" {
    subscription_id  = "a3b33a8c-f601-44af-8997-f6cae272f7b1"
    client_id        = "785704ae-811a-4f00-8725-1e10327233fe"
    client_secret    = "FS88Q~dbDyMsXzTcJ~jHcLunv2GHOF~ZWNuNCaCd"
    tenant_id        = "fc616b6e-000a-4b09-a310-5ce9a8253e10"
    features {

    }
  # Configuration options
}

resource "azurerm_resource_group" "manish" {
   name="manish"
   location="East US"

}
 resource "azurerm_storage_account" "data900003" {
   name                ="data900003"
   resource_group_name ="manish"
   location            ="East US"
   account_tier        = "Standard"
  account_replication_type = "LRS"
 }

resource "azurerm_storage_container" "container1" {
  name="container1"
  storage_account_name  =azurerm_storage_account.data900003.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "sample" {
  name                   = "sample.txt"
  storage_account_name   = azurerm_storage_account.data900003.name
  storage_container_name = azurerm_storage_container.container1.name
  type                   = "Block"
  source                 = "sample.txt"
}


resource "azurerm_virtual_network" "vnet1"{
name ="vent1"
location= azurerm_resource_group.manish.location
resource_group_name=azurerm_resource_group.manish.name
address_space=["10.0.0.0/16"]
 
  subnet{
      name="subnet1"
      address_prefix="10.0.1.0/24"

  }
}