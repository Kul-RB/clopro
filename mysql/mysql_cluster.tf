resource "yandex_mdb_mysql_cluster" "cluster-mysql" {
    depends_on = [ yandex_vpc_subnet.private ]
    name        = var.name_cluster
    environment = var.environment
    network_id  = var.netology_vpc_id
    version     = var.version_db

    resources {
      resource_preset_id = var.preset_id
      disk_type_id       = var.disk_type
      disk_size          = var.disk_size
    }

    maintenance_window {
      type = var.maintenance_type
    }

    host {
        zone       = yandex_vpc_subnet.private["subnet-a-private"].zone
        name       = var.name_host_a
        subnet_id  = yandex_vpc_subnet.private["subnet-a-private"].id
    }

    host {
        zone       = yandex_vpc_subnet.private["subnet-a-private"].zone
        name       = var.name_host_b
        subnet_id  = yandex_vpc_subnet.private["subnet-a-private"].id
    }

    host {
        zone                    = yandex_vpc_subnet.private["subnet-b-private"].zone
        name                    = var.name_host_1_b
        replication_source_name = var.name_host_a
        backup_priority         = 10
        subnet_id               = yandex_vpc_subnet.private["subnet-b-private"].id
    }

    host {
        zone                    = yandex_vpc_subnet.private["subnet-b-private"].zone
        name                    = var.name_host_2_b
        replication_source_name = var.name_host_1_b
        backup_priority         = 5
        subnet_id               = yandex_vpc_subnet.private["subnet-b-private"].id
    }

    deletion_protection = var.deletion_protection

    backup_window_start {
        hours   = var.hours_backup
        minutes = var.minutes_backup
    }
}

resource "yandex_mdb_mysql_database" "mysql_db" {
    depends_on = [ yandex_mdb_mysql_cluster.cluster-mysql ]
    cluster_id = yandex_mdb_mysql_cluster.cluster-mysql.id
    name       = var.name_db
}

resource "yandex_mdb_mysql_user" "mysql_db" {
    depends_on = [ yandex_mdb_mysql_database.mysql_db ]
    cluster_id = yandex_mdb_mysql_cluster.cluster-mysql.id
    name       = var.user
    password   = var.password

    permission {
        database_name = yandex_mdb_mysql_database.mysql_db.name
        roles         = var.roles
    }

    connection_limits {
      max_questions_per_hour   = var.connection_config.quest
      max_updates_per_hour     = var.connection_config.update
      max_connections_per_hour = var.connection_config.connect
      max_user_connections     = var.connection_config.user_connect
    }

    global_permissions = var.global_permissions

    authentication_plugin = var.mysql_plugin
}
