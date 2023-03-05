/*
Copyright 2023 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

module "cluster_autoscaler" {
  source = "./modules/cluster-autoscaler"
  providers = {
    kubernetes = kubernetes
  }

  cluster_name                    = module.eks.cluster_name
  cluster_autoscaler_iam_role_arn = module.cluster_autoscaler_irsa.iam_role_arn
  cluster_autoscaler_version      = var.cluster_autoscaler_version

  depends_on = [
    module.eks
  ]
}

module "metrics_server" {
  source = "./modules/metrics-server"
  providers = {
    kubernetes = kubernetes
  }

  depends_on = [
    module.eks
  ]
}

# AWS Secrets Manager integration
resource "helm_release" "secrets_store_csi_driver" {
  name       = "secrets-store-csi-driver"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"
  version    = "1.3.1"

  depends_on = [
    module.eks
  ]
}

resource "helm_release" "secrets_store_csi_driver_provider_aws" {
  name       = "aws-secrets-manager"
  namespace  = "kube-system"
  repository = "https://aws.github.io/secrets-store-csi-driver-provider-aws"
  chart      = "secrets-store-csi-driver-provider-aws"
  version    = "0.3.0"

  depends_on = [
    module.eks
  ]
}
