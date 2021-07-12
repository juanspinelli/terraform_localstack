variable "aplicacion" {
  type = string
  default = "new_app"
}

variable "proyecto" {
  type = string
  default = "tf_localstack"
}

variable "propietario" {
  type = string
  default = "User"
}

variable "entorno" {
  type = string
  default = "test"
}

variable "pais" {
  type = string
  default = "Argentina"
}

variable "tipo" {
  type = string
  default = "eliminar"
}

variable "s3_bucket_name" {
  type    = list(string)
  default = ["raw", "transformed", "staging", "enriched", "sandbox"]
}