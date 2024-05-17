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

variable "user" {
  type        = string
  description = "User for MySQL"
}

variable "password" {
  type = string
  description = "Password for MySQL user"
}

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "netology_vpc_id" {
  type = string
  description = "Id VPC"
}

variable "private_subnet" {
  type = list(object({
    name = string
    default_cidr_private = list(string)
    zone = string
  }))
  description = "Configuration subnet at different zone"
}

variable "name_cluster" {
  type = string
  default = "mysql_cluster"
  description = "Name cluster"
}

variable "environment" {
  type = string
  default = "PRESTABLE"
  description = "Environment cluster mysql"
}

variable "version_db" {
  type = string
  default = "8.0"
  description = "Version cluster MySQL"
}

variable "preset_id" {
  type = string
  default = "b1.medium"
  description = "https://yandex.cloud/en/docs/managed-mysql/concepts/instance-types"
}

variable "disk_type" {
  type = string
  default = "network-ssd"
  description = "type disk"
}

variable "disk_size" {
  type = number
  default = 20
  description = "Disk size"
}

variable "maintenance_type" {
  type = string
  default = "ANYTIME"
  description = "Maintenance type"
}

variable "zone_a" {
    type = string
    default = "ru-central1-a"
    description = "Zone"
}

variable "zone_b" {
    type = string
    default = "ru-central1-b"
    description = "Zone"
}

variable "zone_d" {
    type = string
    default = "ru-central1-d"
    description = "Zone"
}

variable "name_host_a" {
  type = string
  default = "node-a"
  description = "Name node"
}

variable "name_host_b" {
  type = string
  default = "node-b"
  description = "Name node"
}

variable "name_host_1_b" {
  type = string
  default = "node-1-b"
  description = "Name node"
}

variable "name_host_2_b" {
  type = string
  default = "node-2-b"
  description = "Name node"
}

variable "deletion_protection" {
  type = bool
  default = true
  description = "Deletion protection"
}

variable "hours_backup" {
  type = number
  default = 23
  description = "Hours for backup"
}

variable "minutes_backup" {
  type = number
  default = 59
  description = "Minute for backup"
}

variable "name_db" {
  type = string
  default = "netology_db"
  description = "Name database"
}

variable "roles" {
  type = list(string)
  default = [ "ALL" ]
  description = "Permission"
}

variable "connection_config" {
  type = object({
    quest = number
    update = number
    connect = number
    user_connect = number
  })
  default = {
    quest = 10
    update = 30
    connect = 40
    user_connect = 10
  }
  description = "Connection configuration"
}

variable "global_permissions" {
  type = list(string)
  default = [ "PROCESS" ]
  description = "Global permissions"
}

variable "mysql_plugin" {
  type = string
  default = "SHA256_PASSWORD"
  description = "Authentication plugin"
}
