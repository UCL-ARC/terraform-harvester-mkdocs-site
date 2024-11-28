variable "img_display_name" {
  type        = string
  description = "Display name of an image in the harvester-public namespace"
}

variable "namespace" {
  type        = string
  description = "Namespace that the SSH public key and network are already deployed in, and that the VM will be deployed in"
}

variable "network_name" {
  type        = string
  description = "Name of a network in the specified namespace"
}

variable "prefix" {
  type        = string
  description = "Prefix for the VM name"
}

variable "public_key" {
  type        = string
  description = "Name of an SSH key in the specified namespace"
}

variable "vm_count" {
  type    = number
  default = 1
}
