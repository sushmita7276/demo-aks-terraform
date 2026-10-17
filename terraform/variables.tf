
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-aks"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus"
}
variable "vnet_name" {
    description = "Azure virtual network name"
    type = string
    default = "demo_aks_vnet"
}

variable "vnet_address_space" {
    description = "vnet address space"
    type = list(string)
    default = ["172.16.0.0/16"]
}

variable "snetaks_subnet_name" {
    description = "aks subnet name"
    type = string
    default = "demo_aks_snet"
}

variable "snetaks_subnet_prefix" {
    description = "aks subnet prefix"
    type = list(string)
    default = ["172.16.1.0/24"]
}


# AKS variables

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "demo_aks"
}

variable "aks_dns_prefix" {
  description = "AKS DNS prefix"
  type        = string
  default     = "demo-aks-dnsp"
}

variable "node_count" {
  description = "Initial number of AKS nodes"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "AKS worker node VM size"
  type        = string
  default     = "Standard_D2s_v6"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "demoaksacr"
}
