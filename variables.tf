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
variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "netology-vpc"
  description = "VPC name"
}

variable "subnet_public" {
  type        = string
  default     = "public"
  description = "Subnet name"
}

variable "name_sa" {
  type        = string
  default     = "object-store-sa"
  description = "SA name"
}

variable "role" {
  type        = string
  default     = "editor"
  description = "SA role"
}

variable "bucket_name" {
  type        = string
  default     = "kulebyakinr-08052024"
  description = "Bucket name"
}

variable "bucket_size" {
  type        = number
  default     = 15000000
  description = "Bucket size"
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

variable "inst_group_name" {
  type        = string
  default     = "netology-group"
  description = "Name instance group"
}

variable "platform" {
  type        = string
  default     = "standard-v3"
  description = "Name platform"
}

variable "memory" {
  type        = number
  default     = 1
  description = "RAM"
}

variable "core" {
  type        = number
  default     = 2
  description = "core"
}

variable "core_frac" {
  type        = number
  default     = 20
  description = "Core fraction"
}

variable "mode" {
  type        = string
  default     = "READ_WRITE"
  description = "Mode boot_disk"
}

variable "image_temp" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
  description = "Id image for boot_disk"
}

variable "scale" {
  type        = number
  default     = 3
  description = "Scale policy"
}

variable "max_un" {
  type        = number
  default     = 2
  description = "Max unavailable"
}

variable "max_ex" {
  type        = number
  default     = 0
  description = "Max expansion"
}

variable "target_name" {
  type        = string
  default     = "lb-group"
  description = "Name target group"
}

variable "lb_name" {
  type        = string
  default     = "app-load-balancer-for-ig"
  description = "Name LB"
}

variable "lb_listener" {
  type        = string
  default     = "lb-listener"
  description = "Name LB Listener"
}

variable "port" {
  type        = number
  default     = 80
  description = "Port"
}

variable "ip_version" {
  type        = string
  default     = "ipv4"
  description = "IP version"
}

variable "health_name" {
  type        = string
  default     = "http"
  description = "Healthcheck name"
}

variable "path_site" {
  type        = string
  default     = "/index.html"
  description = "path"
}

variable "router_name" {
  type        = string
  default     = "alb-router"
  description = "Router name"
}

variable "back_alb" {
  type        = string
  default     = "back"
  description = "Backend group name"
}

variable "http_back_alb" {
  type        = string
  default     = "http-back"
  description = "Backend group name"
}

variable "panic_number" {
  type        = number
  default     = 30
  description = "Panic threshold"
}

variable "timeout" {
  type        = string
  default     = "5s"
  description = "Timeout"
}

variable "vh_name" {
  type        = string
  default     = "virt-host-alb"
  description = "Virtual host name"
}

variable "route" {
  type        = string
  default     = "route-vh-alb"
  description = "Virtual host route"
}