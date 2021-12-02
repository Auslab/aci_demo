variable "tenant_name" {
  description = "Tenant name"
  type        = string
}

variable "vpc_name" {
  type        = string
  description = "vPC port group name"
}

variable "anp_name" {
  description = "Application Networking Profile name"
  type        = string
}

variable "epg_name" {
  description = "EPG name"
  type        = string
}

variable "leaf_a_id" {
  type        = string
  description = "A side vPC leaf ID"
}

variable "leaf_b_id" {
  type        = string
  description = "A side vPC leaf ID"
}

variable "vlan_id" {
  description = "VLAN ID for encap"
  type        = string
}
