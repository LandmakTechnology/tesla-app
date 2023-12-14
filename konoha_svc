resource "kubernetes_service_v1" "konoha-svc" {
  metadata {
    name = "konoha-svc"
  }
  spec {
    selector = {
      app = "konoha"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
