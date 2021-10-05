data "aci_tenant" "common" {
  name = "common"
}

resource "aci_tenant" "terraform_demo" {
  name = "terraform-demo"
}

data "aci_vrf" "prod" {
  tenant_dn = data.aci_tenant.common.id
  name      = "Prod"
}

data "aci_l3_outside" "prod_out" {
  tenant_dn = data.aci_tenant.common.id
  name      = "prod-l3-out"
}

resource "aci_bridge_domain" "demo_1" {
  tenant_dn                = aci_tenant.terraform_demo.id
  description              = "Frontend app bd"
  name                     = "bd-dev-172.19.6.0_24"
  relation_fv_rs_ctx       = data.aci_vrf.prod.id
  relation_fv_rs_bd_to_out = [data.aci_l3_outside.prod_out.id]
}

resource "aci_subnet" "field_hx_net_1_subnet" {
  parent_dn                       = aci_bridge_domain.demo_1.id
  description                     = "Frontend app network"
  ip                              = "172.19.6.1/24"
  scope                           = ["public"]
}