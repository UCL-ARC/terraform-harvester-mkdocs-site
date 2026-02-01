terraform {

  required_version = ">= 1.8.5"

  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "1.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.5"
    }
  }

}
