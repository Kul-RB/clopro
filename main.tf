resource "yandex_vpc_network" "netology-vpc" {
  name = var.vpc_name
}

module "mysql" {
  source = "./mysql"
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  user = var.user
  password = var.password
  default_zone = var.default_zone
  netology_vpc_id = yandex_vpc_network.netology-vpc.id
  private_subnet = var.private_subnet
}

module "kubernetes" {
  source = "./kubernetes"
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  default_zone = var.default_zone
  netology_vpc_id = yandex_vpc_network.netology-vpc.id
  public_subnet = var.public_subnet
}