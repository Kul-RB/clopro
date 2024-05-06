variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "security_group_id" {
  type        = string
  description = "Id security group"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_private" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "netology"
  description = "VPC network"
}

variable "subnet_public" {
  type        = string
  default     = "public"
  description = "subnet name"
}

variable "subnet_private" {
  type        = string
  default     = "private"
  description = "subnet name"
}

variable "name_egw" {
  type        = string
  default     = "egress-gateway"
  description = "gateway name"
}

variable "dest_prefix" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Destination prefix"
}

variable "name_instance" {
  type        = string
  default     = "nat"
  description = "NAT name"
}

variable "platform" {
  type        = string
  default     = "standard-v1"
  description = "Platform name"
}

variable "core" {
  type        = number
  default     = 2
  description = "Count core for NAT"
}

variable "memory" {
  type        = number
  default     = 4
  description = "Count memory for NAT"
}

variable "core_frac" {
  type        = number
  default     = 20
  description = "Count core fraction for NAT"
}

variable "type_disk" {
  type        = string
  default     = "network-ssd"
  description = "Type disk for NAT"
}

variable "disk_size" {
  type        = number
  default     = 20
  description = "Count memory for NAT"
}

variable "image_nat" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "Image id NAT"
}

variable "ipv4" {
  type        = bool
  default     = true
  description = "Enable ipv4 for NAT"
}

variable "ip_nat" {
  type        = string
  default     = "192.168.10.254"
  description = "Image id NAT"
}

variable "name_vm_public" {
  type        = string
  default     = "public"
  description = "Name VM with IP public"
}

variable "vm_family_os" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family OS"
}

variable "name_vm_private" {
  type        = string
  default     = "private"
  description = "Name VM with IP public"
}