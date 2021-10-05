provider "aci" {
  # Configuration options
}

provider "vsphere" {
  vsphere_server       = var.vcsa_fury_hostname
  user                 = var.vcsa_fury_username
  password             = var.vcsa_fury_password
  allow_unverified_ssl = true
}

provider "ad" {
  winrm_hostname = var.ad_infra.hostname
  winrm_username = var.ad_infra.username
  winrm_password = var.ad_infra.password
  winrm_insecure = true
  winrm_port     = 5986
  winrm_proto    = "https"
}
