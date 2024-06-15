terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}
variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "public_ssh_key" {
  description = "SSH public key for accessing instances"
  type        = string
}

variable "public_ssh_key_name" {
  description = "Name for the SSH key"
  type        = string
}


variable "location" {
  description = "Location for the servers"
  type        = string
  default     = "ash"
}

variable "network_zone" {
    description = "Network zone for the network"
    type        = string
    default     = "us-east"
}

variable "image" {
    description = "Image for the servers"
    type        = string
    default     = "ubuntu-24.04"
}


