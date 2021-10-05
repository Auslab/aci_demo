data "aci_tenant" "common" {
  name = "common"
}

data "aci_rest" "vrf_prod" {
  tenant_dn = data.aci_tenant.common.id
  name      = "Prod"
}