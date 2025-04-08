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

Terraform ~> 1.11.0\
Verified on AWS EKS but should be Cloud agnostic

### Outputs

   none

