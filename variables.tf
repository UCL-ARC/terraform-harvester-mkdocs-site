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

variable "baseos_repo_url" {
  type        = string
  description = "URL where the BaseOS RPMs can be accessed"
}

variable "appstream_repo_url" {
  type        = string
  description = "URL where the AppStream RPMs can be accessed"
}

variable "mkdocs_repo" {
  type        = string
  description = "HTTPS URL for a publicly-accessible mkdocs repository"
}

variable "mkdocs_repo_branch" {
  type        = string
  default     = "main"
  description = "Name of a branch in the mkdocs repository"
}

variable "local_port" {
  type        = number
  default     = 3000
  description = "Port on your local machine where the site will be served through an SSH tunnel"
}