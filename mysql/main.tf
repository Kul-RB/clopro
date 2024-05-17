resource "yandex_vpc_subnet" "private"{
  for_each = { for res in var.private_subnet: res.name=>res }
  name           = each.key
  v4_cidr_blocks = each.value.default_cidr_private
  zone           = each.value.zone
  network_id     = var.netology_vpc_id
}

