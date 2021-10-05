variable "frontend_network" {
  type        = string
  description = "VM Network name for frontend endpoints"
}

variable "backend_network" {
  type        = string
  description = "VM Network name for backend endpoints"
}
variable "frontend_subnet" {
  type        = string
  description = "Infoblox subnet name for frontend endpoints"
}

variable "backend_subnet" {
  type        = string
  description = "Infoblox subnet name for backend endpoints"
}

variable "vcenter_hostname" {
  type        = string
  description = "vCenter hostname"
}
