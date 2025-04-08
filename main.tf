resource "vault_auth_backend" "main" {
  namespace   = var.namespace
  description = var.description
  type        = "kubernetes"
}


resource "vault_kubernetes_auth_backend_config" "main" {
  namespace              = var.namespace
  backend                = vault_auth_backend.main.path
  kubernetes_host        = var.kubernetes_host
  kubernetes_ca_cert     = base64decode(var.kubernetes_ca_cert)
  token_reviewer_jwt     = var.token
  issuer                 = "api"
  disable_iss_validation = "true"
  depends_on             = [vault_auth_backend.main]
}

resource "vault_kubernetes_auth_backend_role" "main" {
  namespace                        = var.namespace
  backend                          = vault_auth_backend.main.path
  role_name                        = "${var.namespace}-role"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = [var.namespace]
  token_ttl                        = 3600
  token_policies                   = ["default"]
  audience                         = "vault"
}