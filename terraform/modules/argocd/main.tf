
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}


resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.3.11" 
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  
  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }
}
