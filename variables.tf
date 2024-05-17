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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "private_subnet" {
  type = list(object({
    name = string
    default_cidr_private = list(string)
    zone = string
  }))
  default = [ {
    name = "subnet-a-private"
    default_cidr_private = ["192.168.10.0/24"]
    zone = "ru-central1-a"
  },
  {
    name = "subnet-b-private"
    default_cidr_private = ["192.168.11.0/24"]
    zone = "ru-central1-b"
  } ]
}

variable "public_subnet" {
  type = list(object({
    name = string
    default_cidr_public = list(string)
    zone = string
  }))
  default = [ {
    name = "subnet-a-public"
    default_cidr_public = ["192.168.20.0/24"]
    zone = "ru-central1-a"
  },
  {
    name = "subnet-b-public"
    default_cidr_public = ["192.168.21.0/24"]
    zone = "ru-central1-b"
  },
  {
    name = "subnet-d-public"
    default_cidr_public = ["192.168.22.0/24"]
    zone = "ru-central1-d"
  } ]
}


variable "vpc_name" {
  type        = string
  default     = "netology"
  description = "VPC network"
}
