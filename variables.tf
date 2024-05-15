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

variable "service_account_id" {
  type        = string
  description = "Id security group"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


variable "bucket_name" {
  type        = string
  default     = "kulebyakinr-08052024"
  description = "Bucket name"
}


variable "name_for_bucket" {
  type        = string
  default     = "shishkin.jpg"
  description = "Name file in bucket"
}

variable "path_file" {
  type        = string
  default     = "IMG_1382.jpg"
  description = "Path to file"
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