resource "yandex_iam_service_account" "sa_k8s" {
  name = var.name_k8s_account
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_editor" {
  folder_id = var.folder_id
  role = var.role
  member = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_image_puller" {
  folder_id = var.folder_id
  role = var.role_puller
  member = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}

resource "yandex_kms_symmetric_key" "key-a" {
  name              = var.name_kms
  description       = "description for key"
  default_algorithm = var.algorithm
  rotation_period   = var.period_kms
}

resource "yandex_kubernetes_cluster" "cluster_k8s" {
  name = var.name_cluster

  network_id = var.netology_vpc_id

  master {
    regional {
      region = var.region_cluster

      location {
        zone = yandex_vpc_subnet.public["subnet-a-public"].zone
        subnet_id = yandex_vpc_subnet.public["subnet-a-public"].id
      }

      location {
        zone = yandex_vpc_subnet.public["subnet-b-public"].zone
        subnet_id = yandex_vpc_subnet.public["subnet-b-public"].id
      }

      location {
        zone = yandex_vpc_subnet.public["subnet-d-public"].zone
        subnet_id = yandex_vpc_subnet.public["subnet-d-public"].id
      }
    }
  
    version = var.version_k8s
    public_ip = true
  
  }
  
  release_channel = var.release_channel
  network_policy_provider = var.network_provider
  
  kms_provider {
    key_id = yandex_kms_symmetric_key.key-a.id
  }

  service_account_id = yandex_iam_service_account.sa_k8s.id
  node_service_account_id = yandex_iam_service_account.sa_k8s.id
    depends_on = [ yandex_resourcemanager_folder_iam_member.k8s_editor,
    yandex_resourcemanager_folder_iam_member.k8s_image_puller, yandex_vpc_subnet.public ]
}

resource "yandex_kubernetes_node_group" "node_group_k8s" {
    depends_on = [ yandex_kubernetes_cluster.cluster_k8s ]
  cluster_id = yandex_kubernetes_cluster.cluster_k8s.id
  name = var.node_group_name
  version = var.version_k8s

  instance_template {
    platform_id = var.platform_id

    network_interface {
      nat = true
      subnet_ids = ["${yandex_vpc_subnet.public["subnet-a-public"].id}"]
    }

    resources {
      memory = var.memory
      cores = var.cores
    }

    boot_disk {
      type = var.type_disk
      size = var.size_disk
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = var.container_runtime
    }

    metadata = {
        ssh-keys  = "ubuntu:${local.public_key}"
    }
  }

  scale_policy {
    auto_scale {
      min = var.min_count
      max = var.max_count
      initial = var.initial_count
    }
  }

  allocation_policy {
    location {
      zone = var.default_zone
    }
  }
}