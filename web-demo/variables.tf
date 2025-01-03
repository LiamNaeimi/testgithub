
variable "location" {
  type        = string
  description = "The location of the source"
  default     = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sa_name" {
  type        = string
  description = "Name og the storage accoount"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
}
variable "index_document" {
  type        = string
  description = "Name of the nedes document"
}
