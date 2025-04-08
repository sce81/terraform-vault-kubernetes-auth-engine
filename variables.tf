variable "namespace" {
  type    = string
  default = "admin"
}
variable "path" {
  type    = string
  default = "kubernetes"
}
variable "description" {
  type    = string
  default = "kubernetes secrets backend"
}
variable "default_lease_ttl_seconds" {
  type    = number
  default = 43200
}
variable "max_lease_ttl_seconds" {
  type    = number
  default = 86400
}
variable "kubernetes_host" {
  type = string
}
variable "kubernetes_ca_cert" {
  type = string
}
variable "token" {
  type = string
}
variable "disable_local_ca_jwt" {
  type    = bool
  default = false
}