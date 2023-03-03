resource "kubernetes_deployment" "app-server" {
  depends_on = [module.eks.cluster_status]
  metadata {
    name = "statuspage"
    labels = {
      test = "statuspage"
    }
  }
  spec {
    #TODO: Rechange the nun of replicas from 0 to 3
    replicas = 0  

    selector {
      match_labels = {
        test = "statuspage"
      }
    }
  

    template {
      metadata {
        labels = {
          test = "statuspage"
        }
      }
    

      spec {
        container {
          image = "yaringabay1/app_60:${var.update_image_tag}"
          name  = "actual-cont-app"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
