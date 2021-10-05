module "siwapp_haproxy_app" {
  count   = 1
  source  = "app.terraform.io/Auslab/vms/vsphere"
  version = "0.0.43"

  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  module_index = count.index
  vm = {
    vcenter    = var.vcenter_hostname
    template   = "Centos_7-Template"
    name       = "siwapp-aci-haproxy-app-${count.index + 1}"
    datacenter = "GeneralPurpose"
    datastore  = "GeneralPurpose"
    folder     = "Users/robbeck"
    cluster    = "fury-hx-cluster"
    cpu        = 2
    memory     = 4096
    disk       = 40
    network    = var.frontend_network
    subnet     = var.frontend_subnet
    os_type    = "linux"
  }
  user = {
    userId    = "robbeck"
    firstName = "Brandon"
    lastName  = "Beck"
  }
  deployment = {
    guid    = 8675309
    name    = "acidemo"
    project = "acidemo"
  }
  domain_admin = {
    username = ""
    password = ""
  }
  windows_product_key = ""
}

module "siwapp_web" {
  count   = 3
  source  = "app.terraform.io/Auslab/vms/vsphere"
  version = "0.0.43"

  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  module_index = count.index
  vm = {
    vcenter    = var.vcenter_hostname
    template   = "Centos_7-Template"
    name       = "siwapp-aci-web-${count.index + 1}"
    datacenter = "GeneralPurpose"
    datastore  = "GeneralPurpose"
    folder     = "Users/robbeck"
    cluster    = "fury-hx-cluster"
    cpu        = 2
    memory     = 4096
    disk       = 40
    network    = var.frontend_network
    subnet     = var.frontend_subnet
    os_type    = "linux"
  }
  user = {
    userId    = "robbeck"
    firstName = "Brandon"
    lastName  = "Beck"
  }
  deployment = {
    guid    = 8675309
    name    = "acidemo"
    project = "acidemo"
  }
  domain_admin = {
    username = ""
    password = ""
  }
  windows_product_key = ""
}
module "siwapp_app" {
  count   = 3
  source  = "app.terraform.io/Auslab/vms/vsphere"
  version = "0.0.43"

  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  module_index = count.index
  vm = {
    vcenter    = var.vcenter_hostname
    template   = "Centos_7-Template"
    name       = "siwapp-aci-app-${count.index + 1}"
    datacenter = "GeneralPurpose"
    datastore  = "GeneralPurpose"
    folder     = "Users/robbeck"
    cluster    = "fury-hx-cluster"
    cpu        = 2
    memory     = 4096
    disk       = 40
    network    = var.backend_network
    subnet     = var.backend_subnet
    os_type    = "linux"
  }
  user = {
    userId    = "robbeck"
    firstName = "Brandon"
    lastName  = "Beck"
  }
  deployment = {
    guid    = 8675309
    name    = "acidemo"
    project = "acidemo"
  }
  domain_admin = {
    username = ""
    password = ""
  }
  windows_product_key = ""
}
module "siwapp_db" {
  count   = 3
  source  = "app.terraform.io/Auslab/vms/vsphere"
  version = "0.0.43"

  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  module_index = count.index
  vm = {
    vcenter    = var.vcenter_hostname
    template   = "Centos_7-Template"
    name       = "siwapp-aci-db-${count.index + 1}"
    datacenter = "GeneralPurpose"
    datastore  = "GeneralPurpose"
    folder     = "Users/robbeck"
    cluster    = "fury-hx-cluster"
    cpu        = 2
    memory     = 4096
    disk       = 40
    network    = var.backend_network
    subnet     = var.backend_subnet
    os_type    = "linux"
  }
  user = {
    userId    = "robbeck"
    firstName = "Brandon"
    lastName  = "Beck"
  }
  deployment = {
    guid    = 8675309
    name    = "acidemo"
    project = "acidemo"
  }
  domain_admin = {
    username = ""
    password = ""
  }
  windows_product_key = ""
}

module "siwapp_haproxy_db" {
  count   = 1
  source  = "app.terraform.io/Auslab/vms/vsphere"
  version = "0.0.43"

  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  module_index = count.index
  vm = {
    vcenter    = var.vcenter_hostname
    template   = "Centos_7-Template"
    name       = "siwapp-aci-haproxy-db-${count.index + 1}"
    datacenter = "GeneralPurpose"
    datastore  = "GeneralPurpose"
    folder     = "Users/robbeck"
    cluster    = "fury-hx-cluster"
    cpu        = 2
    memory     = 4096
    disk       = 40
    network    = var.frontend_network
    subnet     = var.frontend_subnet
    os_type    = "linux"
  }
  user = {
    userId    = "robbeck"
    firstName = "Brandon"
    lastName  = "Beck"
  }
  deployment = {
    guid    = 8675309
    name    = "acidemo"
    project = "acidemo"
  }
  domain_admin = {
    username = ""
    password = ""
  }
  windows_product_key = ""
}

output "siwapp_vms" {
  value = [for v in concat(module.siwapp_haproxy_app, module.siwapp_haproxy_db, module.siwapp_web, module.siwapp_app, module.siwapp_db) : v.vm]
}
