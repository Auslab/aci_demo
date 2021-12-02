resource "aci_epg_to_static_path" "path" {
  application_epg_dn = "uni/tn-${var.tenant_name}/ap-${var.anp_name}/epg-${var.epg_name}"
  tdn                = "topology/pod-1/protpaths-${var.leaf_a_id}-${var.leaf_b_id}/pathep-[${var.vpc_name}]"
  encap              = "vlan-${var.vlan_id}"
  mode               = "regular"
}

output "path_dn" {
  value = aci_epg_to_static_path.path.id
}
