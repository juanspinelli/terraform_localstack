variable "aplicacion" {
  type = string
  default = "advertising_pads_aml"
}

variable "proyecto" {
  type = string
  default = "pads"
}

variable "propietario" {
  type = string
  default = "CloudController"
}

variable "entorno" {
  type = string
  default = "test"
}

variable "pais" {
  type = string
  default = "MLA"
}

variable "tipo" {
  type = string
  default = "eliminar"
}

variable "s3_bucket_name" {
  type    = list(string)
  default = ["raw", "transformed", "staging", "enriched", "sandbox"]
}