# module "vpc_static_paths" {
#   for_each = { for path in csvdecode(file("paths.csv")) : "${path.vpc_name}_${path.tenant_name}_${path.anp_name}_${path.epg_name}_${path.vlan_id}" => path }
#   source   = "./modules/static_path"

#   vpc_name    = each.value.vpc_name
#   tenant_name = each.value.tenant_name
#   anp_name    = each.value.anp_name
#   epg_name    = each.value.epg_name
#   leaf_a_id   = each.value.leaf_a_id
#   leaf_b_id   = each.value.leaf_b_id
#   vlan_id     = each.value.vlan_id
# }

# output "vpc_static_path_dns" {
#   value = [for path in module.vpc_static_paths : path.path_dn]
# }

variable "aci_paths" {
  type = string
}

output "formatted_csv" {
  value = replace(var.aci_paths, "\\n", "\n")
}

# module "vpc_static_paths" {
#   for_each = { for path in csvdecode(replace(var.aci_paths, "\\\\n", "\n")) : "${path.vpc_name}_${path.tenant_name}_${path.anp_name}_${path.epg_name}_${path.vlan_id}" => path }
#   source   = "./modules/static_path"

#   vpc_name    = each.value.vpc_name
#   tenant_name = each.value.tenant_name
#   anp_name    = each.value.anp_name
#   epg_name    = each.value.epg_name
#   leaf_a_id   = each.value.leaf_a_id
#   leaf_b_id   = each.value.leaf_b_id
#   vlan_id     = each.value.vlan_id
# }

# output "vpc_static_path_dns" {
#   value = [for path in module.vpc_static_paths : path.path_dn]
# }
