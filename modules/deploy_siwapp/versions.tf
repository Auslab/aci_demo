terraform {
  required_providers {
    ad = {
      source = "hashicorp/ad"
      version = "0.4.3"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.0.2"
    }
    infoblox = {
      source = "techBeck03/infoblox"
      version = "2.0.7"
    }
  }
}