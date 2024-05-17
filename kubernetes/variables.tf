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

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "algorithm" {
  type        = string
  default     = "AES_128"
  description = "Algorithm encrypted"
}

variable "period_kms" {
  type        = string
  default     = "8760h"
  description = "Period kms key"
}

variable "name_kms" {
  type        = string
  default     = "netology-symetric-key"
  description = "Name kms key"
}

variable "netology_vpc_id" {
  type = string
  description = "Id VPC"
}

variable "public_subnet" {
  type = list(object({
    name = string
    default_cidr_public = list(string)
    zone = string
  }))
  description = "Configuration subnet at different zone"
}

variable "name_k8s_account" {
  type = string
  default = "k8s-sa"
  description = "Name service account"
}

variable "role" {
  type = string
  default = "editor"
  description = "Role"
}

variable "role_puller" {
  type = string
  default = "container-registry.images.puller"
  description = "Role"
}

variable "name_cluster" {
  type = string
  default = "k8s-cluster"
  description = "Cluster name"
}

variable "region_cluster" {
  type = string
  default = "ru-central1"
  description = "region cluster"
}

variable "version_k8s" {
  type = string
  default = "1.28"
  description = "Version k8s"
}

variable "release_channel" {
  type = string
  default = "STABLE"
  description = "Release channel cluster"
}

variable "network_provider" {
  type = string
  default = "CALICO"
  description = "Network provider cluster"
}

variable "node_group_name" {
  type = string
  default = "node-k8s-group"
  description = "Node group for k8s cluster"
}

variable "platform_id" {
  type = string
  default = "standard-v2"
  description = "Platform id for node"
}

variable "memory" {
  type = number
  default = 2
  description = "Memory for node k8s cluster"
}

variable "cores" {
  type = number
  default = 2
  description = "Cores for node k8s cluster"
}

variable "type_disk" {
  type = string
  default = "network-hdd"
  description = "Type disk for node k8s cluster"
}

variable "size_disk" {
  type = number
  default = 64
  description = "Size disk for node k8s cluster"
}

variable "container_runtime" {
  type = string
  default = "containerd"
  description = "Container runtime for node k8s cluster"
}

variable "min_count" {
  type = number
  default = 3
  description = "Minimal count node for k8s cluster"
}

variable "max_count" {
  type = number
  default = 6
  description = "Maximal count node for k8s cluster"
}

variable "initial_count" {
  type = number
  default = 3
  description = "Initial quantity node for k8s cluster"
}

