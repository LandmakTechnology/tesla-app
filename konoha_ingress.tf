##NGINX

#resource "kubernetes_ingress_v1" "arsenal-ingress" {
#  wait_for_load_balancer = true
#  metadata {
#    name = "arsenal"
#    namespace = "default"
#    annotations = {
#        "cert-manager.io/cluster-issuer" = "arsenal-issuer1"
#  }
#  }
#  spec {
#    ingress_class_name = "nginx"
#    tls {
#      secret_name = "arsenal-secret"
#      hosts = ["arsenal.devopsnetwork.net"] 
#    }
#    rule {
#      host = "arsenal.devopsnetwork.net"  
#      http {
#        path {
#          path = "/"
#          backend {
#            service {
#              name = "arsenal-svc"
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}

##ALB

resource "kubernetes_ingress_v1" "konoha" {
  wait_for_load_balancer = true
  metadata {
    name = "konoha"
    namespace = "default"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "konoha"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/069afb91-11fb-41e9-9044-7b0daf2cb6a1"
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "konoha-svc"
        port {
          number = 80
        }
      }
    }
    rule {
      host = "konoha.devopsnetwork.net"  
      http {
        path {
          path = "/"
          path_type = "Exact"
          backend {
            service {
              name = "konoha-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
