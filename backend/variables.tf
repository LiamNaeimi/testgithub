

variable "rg_backend_name" {
  type        = string
  description = "The name og the resource group"
}

variable "rg_backend_location" {
  type        = string
  description = "The location og the resource"

}

variable "sa_backend_name" {
  type        = string
  description = "The name of the storage account"

}
variable "sc_backend" {
  type        = string
  description = "The name of the container name"

}
variable "kv_backend_name" {
  type        = string
  description = "The name og the key vault"
}

variable "sa_backend_accessky_name" {
  type        = string
  description = "Name of the storage account access key for the backend"
}

