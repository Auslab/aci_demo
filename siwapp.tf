module "siwapp" {
  source           = "git::https://github.com/Auslab/aci_demo.git//modules/deploy_siwapp"
  providers = {
    vsphere  = vsphere
    infoblox = infoblox
    ad       = ad
  }
  frontend_network = "wwdc-shared|user-networks|user-net-1"
  backend_network  = "wwdc-shared|user-networks|mgmt-net-1"
  frontend_subnet  = "172.18.64.0/18"
  backend_subnet   = "172.19.3.0/24"
  vcenter_hostname = var.vcsa_fury_hostname
}

data "vsphere_tag_category" "owner" {
  provider = vsphere
  name     = "owner"
}

output "vms" {
    value = module.siwapp.siwapp_vms
}