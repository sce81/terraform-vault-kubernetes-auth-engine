# terraform-vault-kubernetes-auth-engine
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use. 
Terraform module to setup Kubernetes Auth Engine

Configures Kubernetes Auth Engine for dynamic list of namespaces based on var.namespaces

##### Usage

    module "policy" {
      source               = "git@github.com:sce81/terraform-vault-kubernetes-auth-engine.git"
        for_each = var.namespaces

        namespace          = each.value
        description        = "kubernetes auth backend for ${each.value}"
        kubernetes_host    = data.aws_eks_cluster.cluster.endpoint
        kubernetes_ca_cert = data.aws_eks_cluster.cluster.certificate_authority[0].data
        token              = data.aws_eks_cluster_auth.cluster.token
    }

### Prerequisites

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.36.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.7.0"
    }
  

### Tested

Terraform >= 1.15.7
Verified on AWS EKS but should be Cloud agnostic

### Outputs

   none


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.7 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [vault_auth_backend.main](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_kubernetes_auth_backend_config.main](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.main](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_bound_service_account_names"></a> [bound\_service\_account\_names](#input\_bound\_service\_account\_names) | n/a | `list(string)` | <pre>[<br/>  "default"<br/>]</pre> | no |
| <a name="input_default_lease_ttl_seconds"></a> [default\_lease\_ttl\_seconds](#input\_default\_lease\_ttl\_seconds) | n/a | `number` | `43200` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"kubernetes secrets backend"` | no |
| <a name="input_disable_local_ca_jwt"></a> [disable\_local\_ca\_jwt](#input\_disable\_local\_ca\_jwt) | n/a | `bool` | `false` | no |
| <a name="input_kubernetes_ca_cert"></a> [kubernetes\_ca\_cert](#input\_kubernetes\_ca\_cert) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_host"></a> [kubernetes\_host](#input\_kubernetes\_host) | n/a | `string` | n/a | yes |
| <a name="input_max_lease_ttl_seconds"></a> [max\_lease\_ttl\_seconds](#input\_max\_lease\_ttl\_seconds) | n/a | `number` | `86400` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"admin"` | no |
| <a name="input_path"></a> [path](#input\_path) | n/a | `string` | `"kubernetes"` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
