resource "yandex_vpc_network" "netology-vpc" {
  name = var.vpc_name
}



resource "yandex_vpc_subnet" "public"{
  name           = var.subnet_public
  v4_cidr_blocks = var.default_cidr
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-vpc.id
}

resource "yandex_vpc_subnet" "private"{
  name           = var.subnet_private
  v4_cidr_blocks = var.default_cidr_private
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-vpc.id
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_route_table" "route_table" {
  name = "rt"
  network_id = yandex_vpc_network.netology-vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.ip_nat
  }
}

resource "yandex_compute_instance" "nat" {
    name        = var.name_instance
    platform_id = var.platform
    zone        = var.default_zone

    resources {
        cores   = var.core
        memory = var.memory
    }

    boot_disk {
      initialize_params {
        image_id = var.image_nat
        type = var.type_disk
        size = var.disk_size
      }
    }

    network_interface {
      subnet_id = yandex_vpc_subnet.public.id
      ipv4 = var.ipv4
      ip_address = var.ip_nat
      nat = true
    }

    scheduling_policy { preemptible = true }
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_family_os
}

resource "yandex_compute_instance" "vm_public" {
  name        = var.name_vm_public
  platform_id = var.platform
  resources {
    cores         = var.core
    memory        = var.memory
    core_fraction = var.core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.type_disk
      size = var.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys           = "ubuntu:${local.public_key}"
  }

}



resource "yandex_compute_instance" "vm_private" {
  name        = var.name_vm_private
  platform_id = var.platform
  resources {
    cores         = var.core
    memory        = var.memory
    core_fraction = var.core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.type_disk
      size = var.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

   metadata = {
    ssh-keys           = "ubuntu:${local.public_key}"
  }
}