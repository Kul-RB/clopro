resource "yandex_vpc_network" "netology-vpc" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public"{
  name           = var.subnet_public
  v4_cidr_blocks = var.default_cidr
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-vpc.id
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = var.service_account_id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "create-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
  max_size = var.bucket_size

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }
}

resource "yandex_storage_object" "upload-file" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
  key = var.name_for_bucket
  source = var.path_file
}

resource "yandex_compute_instance_group" "in-group" {
  name = var.inst_group_name
  folder_id = var.folder_id
  service_account_id = var.service_account_id
  deletion_protection = false
  instance_template {
    platform_id = var.platform
    resources {
      memory = var.memory
      cores   = var.core
      core_fraction =  var.core_frac
    }

    boot_disk {
      mode = var.mode
      initialize_params {
        image_id = var.image_temp
      }
    }

    scheduling_policy {
       preemptible = true
    }

    network_interface {
      network_id = yandex_vpc_network.netology-vpc.id
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
      nat = true
    }

    metadata = {
        user-data =  "${file("cloud-init.yaml")}"
        ssh-keys  = "ubuntu:${local.public_key}"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.scale
    }
  }

  allocation_policy {
    zones = ["${var.default_zone}"]
  }

  deploy_policy {
    max_unavailable = var.max_un
    max_expansion   = var.max_ex
  }

  application_load_balancer {
    target_group_name = var.target_name
  }
}

resource "yandex_alb_http_router" "alb-router" {
  name = var.router_name
}

resource "yandex_alb_virtual_host" "alb_vh" {
  name = var.vh_name
  http_router_id = yandex_alb_http_router.alb-router.id
  route {
    name = var.route
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.back_alb.id
        timeout = var.timeout
      }
      http_match {
        path {
          exact = "/"
        }
      }
    }
  }
}

resource "yandex_alb_load_balancer" "alb" {
  name = var.lb_name
  network_id = yandex_vpc_network.netology-vpc.id

  allocation_policy {
    location {
      zone_id = var.default_zone
      subnet_id = yandex_vpc_subnet.public.id
    }
  }
  
  listener {
    name = var.lb_listener
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ var.port ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.alb-router.id
      }
    }
  }
}

resource "yandex_alb_backend_group" "back_alb" {
  name = var.back_alb

  http_backend {
    name = var.http_back_alb
    weight = 1
    port = var.port
    target_group_ids = [ "${yandex_compute_instance_group.in-group.application_load_balancer.0.target_group_id}" ]
    load_balancing_config {
      panic_threshold = var.panic_number
    }
    healthcheck {
      timeout = var.timeout
      interval = var.timeout
      http_healthcheck {
        path = "/"
      }
    }
  }
}