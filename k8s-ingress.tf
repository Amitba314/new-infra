resource "kubernetes_ingress_v1" "ingress" {
  depends_on = [module.eks.cluster_status]
  wait_for_load_balancer = true
  metadata {
    name = "simple-fanout-ingress"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {
        path {
          backend {
            service {
              name = "statuspage-service"
              port {
                number = 5678
              }
            }
          }

          path = "/app1"
        }
      }
    }

  }
}



