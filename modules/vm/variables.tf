variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "cloud_location" {
  type        = string
  description = "resource location"
}

variable "vm_name" {
  type        = string
  description = "vm name"
}

variable "vm_size" {
  type        = string
  description = "virtual machine size"
}
variable "user_name" {
  type        = string
  description = "User name"
}
variable "admin_pass" {
  type        = string
  description = "User password"
}

# disk with default values for the Virtual machine
variable "disk_caching" {
  type        = string
  description = "Disk caching"
  default = "ReadWrite"
}
variable "disk_storage_account_type" {
  type        = string
  description = "Disk storage account type"
  default = "Standard_LRS"
}

# source image reference with default values for the Virtual machine
variable "os_source_image_publisher" {
  type        = string
  description = "image publisher"
  default = "Canonical"
}
variable "os_source_image_sku" {
  type        = string
  description = "image sku"
  default = "18.04-LTS"
}
variable "os_source_image_offer" {
  type        = string
  description = "image offer"
  default = "UbuntuServer"
}
variable "os_source_image_version" {
  type        = string
  description = "image version"
  default = "latest"
}
###################################

variable "availability_id" {
  description = "availability id"
}
variable "disable_password_auth" {
  type        = bool
  description = "disable_password_authentication"
}
variable "nic_id" {
  description = "nic id"
}