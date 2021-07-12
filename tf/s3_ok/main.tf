provider "aws" {
  region = "us-west-2"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    s3 = "http://localstack:4566"
  }
}

resource "aws_s3_bucket" "bucket" {
  count         = "${length(var.s3_bucket_name)}"
  bucket        = "${element(var.s3_bucket_name, count.index)}"
  acl           = "private"
  # force_destroy = "true"
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy
  tags = {
    Detalle     = "${element(var.s3_bucket_name, count.index)}.${var.entorno}.${var.pais}.${var.tipo}"
    Aplicacion  = var.aplicacion
    Proyecto    = var.proyecto
    Propietario = var.propietario
    Pais        = var.pais
  }
  # versioning {
  #  enabled = true
  # }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  lifecycle_rule {
    enabled = true
    transition {
      days = 180
      storage_class = "STANDARD_IA"
    }
    transition {
      days = 360
      storage_class = "GLACIER"
    }
  }
}