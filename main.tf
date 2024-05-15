resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = var.service_account_id
  description        = "static access key for object storage"
}

resource "yandex_kms_symmetric_key" "key-a" {
  name              = var.name_kms
  description       = "description for key"
  default_algorithm = var.algorithm
  rotation_period   = var.period_kms
}

resource "yandex_storage_bucket" "create-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
  
   server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }

  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }
}

resource "yandex_storage_object" "upload-file" {
  depends_on = [ yandex_storage_bucket.create-bucket ]
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
  key = var.name_for_bucket
  source = var.path_file
  
}
