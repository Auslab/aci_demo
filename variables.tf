variable "vcsa_fury_hostname" {
    type = string
    description = "Fury vCenter hostname"
}
variable "vcsa_fury_username" {
    type = string
    description = "Fury vCenter username"
}
variable "vcsa_fury_password" {
    type = string
    description = "Fury vCenter password"
}

variable "ad_infra" {
    description = "Infra Active Directory details"
    type = object({
        hostname = string
        username = string
        password = string
    })
}