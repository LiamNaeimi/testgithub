variable "location" {
  type        = string
  description = "The location og the resource"
  default     = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
  default     = "rg-web-forlean"
}

variable "sa_name" {
  type        = string
  description = "The name og the storage account"
  default     = "saweblean"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default     = "<h1> Web side laget med terraform ass </h1>"
}

variable "index_document" {
  type        = string
  description = "Nme of the index document"
  default     = "index.html"
}
