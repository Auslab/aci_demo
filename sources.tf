data "aci_vrf" "prod" {
  tenant_dn = data.aci_tenant.common.id
  name      = "Prod"
}