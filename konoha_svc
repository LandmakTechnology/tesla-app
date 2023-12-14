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

resource "kubernetes_service_v1" "arsenal-svc" {
  metadata {
    name = "arsenal-svc"
    #annotations = [
                    #"service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
                    #"service.beta.kubernetes.io/aws-load-balancer-scheme" =  "internet-facing"
                    #"service.beta.kubernetes.io/aws-load-balancer-name" = "arsenal-nlb"
                  #]
  }
  spec {
    selector = {
      app = "arsenal"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

#Note Last attempt at practicing NLB service annotations and LoadBalancer did not work as of 12/5/23 but ALB and Nginx+NLB ingress works well.
